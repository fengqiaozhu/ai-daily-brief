#!/bin/sh
# Upload one episode mp4 to a GitHub Release and print its stable URL.
# The mp4 stays outside this repository. This script does not edit HTML and does not git push.
#
# Usage:
#   scripts/publish-video.sh YYYY-MM-DD --file MP4 --sha256 HEX [--prerelease] [--repo OWNER/NAME]
#
# Success writes only the stable download URL to stdout.
# Failure writes one JSON object to stderr and exits non-zero.
# A release created by this run is deleted again when a later step fails.
# Releases that already existed are not deleted.
set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
# 1.5 GiB. At or above this size, stop and report. Do not upload.
MAX_BYTES=1610612736
DEFAULT_REPO=fengqiaozhu/ai-daily-brief

export NO_COLOR=1
export GH_FORCE_TTY=0
export GH_PROMPT_DISABLED=1
export GIT_TERMINAL_PROMPT=0
unset FORCE_COLOR || true

WORKDIR=$(mktemp -d)
trap 'rm -rf "$WORKDIR"' EXIT

CREATED_ID=
CREATED_PUBLISHED=0
REPO=$DEFAULT_REPO
TAG=
DATE=
FILE=
EXPECTED=
PRERELEASE=false

note_timing() {
  if [ -n "${AI_DAILY_VIDEO_TIMING_FILE:-}" ]; then
    printf '%s=%s\n' "$1" "$2" >> "$AI_DAILY_VIDEO_TIMING_FILE"
  fi
}

now_ms() {
  python3 -c 'import time; print(int(time.time()*1000))'
}

fail() {
  stage=$1
  err=$2
  rollback=none
  set +e
  if [ -n "$CREATED_ID" ]; then
    gh api --method DELETE "repos/$REPO/releases/$CREATED_ID" >"$WORKDIR/del.out" 2>"$WORKDIR/del.err"
    del_code=$?
    if [ "$del_code" -eq 0 ]; then
      rollback=deleted_release_created_by_this_run
      if [ "$CREATED_PUBLISHED" -eq 1 ]; then
        gh api --method DELETE "repos/$REPO/git/refs/tags/$TAG" >"$WORKDIR/tag.out" 2>"$WORKDIR/tag.err"
        if [ "$?" -ne 0 ]; then
          rollback=deleted_release_tag_delete_failed
          err="$err
$(head -c 2000 "$WORKDIR/tag.err" 2>/dev/null || true)"
        fi
      fi
    else
      rollback=delete_failed
      err="$err
$(head -c 2000 "$WORKDIR/del.err" 2>/dev/null || true)"
    fi
  fi
  err=$(printf '%s' "$err" | head -c 8000)
  jq -n --arg stage "$stage" --arg error "$err" --arg rollback "$rollback" \
    '{ok:false,stage:$stage,error:$error,rollback:$rollback}' >&2 || \
    printf '{"ok":false,"stage":"%s","error":"jq failed while reporting an error","rollback":"%s"}\n' "$stage" "$rollback" >&2
  exit 1
}

fail_api() {
  raw=$1
  stage=$2
  if printf '%s' "$raw" | grep -Eqi 'HTTP 40[13]|Bad credentials|Requires authentication|Resource not accessible|insufficient|permission'; then
    stage=permission
  fi
  fail "$stage" "$raw"
}

USAGE="usage: scripts/publish-video.sh YYYY-MM-DD --file MP4 --sha256 HEX [--prerelease] [--repo OWNER/NAME]"

if [ "${1:-}" = "" ]; then
  fail args "missing date. $USAGE"
fi
DATE=$1
shift
case "$DATE" in
  [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) ;;
  *)
    fail args "date must look like YYYY-MM-DD. $USAGE"
    ;;
esac

while [ "$#" -gt 0 ]; do
  case "$1" in
    --file)
      FILE=${2:-}
      shift 2
      ;;
    --sha256)
      EXPECTED=${2:-}
      shift 2
      ;;
    --prerelease)
      PRERELEASE=true
      shift
      ;;
    --repo)
      REPO=${2:-}
      shift 2
      ;;
    *)
      fail args "unknown argument: $1. $USAGE"
      ;;
  esac
done

if [ -z "$FILE" ] || [ -z "$EXPECTED" ]; then
  fail args "both --file and --sha256 are required. $USAGE"
fi
case "$REPO" in
  [A-Za-z0-9_.-]*/[A-Za-z0-9_.-]*) ;;
  *) fail args "repo must look like owner/name" ;;
esac

TAG="video-$DATE"
NAME="ai-daily-$DATE.mp4"
URL="https://github.com/$REPO/releases/download/$TAG/$NAME"

if [ ! -f "$FILE" ]; then
  fail file "not a regular file: $FILE"
fi
FILE_ABS=$(python3 -c 'import os,sys; print(os.path.realpath(sys.argv[1]))' "$FILE")
ROOT_ABS=$(python3 -c 'import os,sys; print(os.path.realpath(sys.argv[1]))' "$ROOT")
case "$FILE_ABS" in
  "$ROOT_ABS"/*)
    fail file_location "mp4 must stay outside the site repository: $FILE_ABS"
    ;;
esac

bytes=$(wc -c < "$FILE" | tr -d '[:space:]')
too_big=$(awk -v n="$bytes" -v max="$MAX_BYTES" 'BEGIN { print (n+0 >= max+0) ? "yes" : "no" }')
if [ "$too_big" = "yes" ]; then
  fail size_limit "file is ${bytes} bytes, at or above ${MAX_BYTES} (1.5 GiB). Stop and report. Do not upload, do not edit the page, do not push."
fi

EXPECTED=$(printf '%s' "$EXPECTED" | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')
if ! printf '%s' "$EXPECTED" | grep -Eq '^[0-9a-f]{64}$'; then
  fail args "sha256 must be 64 hex characters"
fi
actual=$(sha256sum "$FILE" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
if [ "$actual" != "$EXPECTED" ]; then
  fail sha256_local "local sha256 mismatch expected=$EXPECTED actual=$actual"
fi

t0=$(now_ms)
set +e
git ls-remote "https://github.com/$REPO.git" refs/heads/main >"$WORKDIR/ls.out" 2>"$WORKDIR/ls.err"
ls_code=$?
set -e
SHA=$(awk '{ for (i = 1; i <= NF; i++) if ($i ~ /^[0-9a-f]{40}$/) { print $i; exit } }' "$WORKDIR/ls.out")
if [ "$ls_code" -ne 0 ] || ! printf '%s' "$SHA" | grep -Eq '^[0-9a-f]{40}$'; then
  fail_api "$(cat "$WORKDIR/ls.err"; printf '\n'; cat "$WORKDIR/ls.out")" target_sha
fi
note_timing target_sha_ms "$(( $(now_ms) - t0 ))"
note_timing target_sha "$SHA"

if [ "$PRERELEASE" = "true" ]; then
  REL_NAME="AI 早报 $DATE 视频预演（不是正式期次）"
  REL_BODY="预演文件，不是正式期次。正文以站点图文版为准。用完即删。"
else
  REL_NAME="AI 早报 $DATE 视频"
  REL_BODY="外链视频。正文以站点图文版为准。"
fi

set +e
gh release view "$TAG" --repo "$REPO" --json id >"$WORKDIR/exists.out" 2>"$WORKDIR/exists.err"
exists_code=$?
set -e
if [ "$exists_code" -eq 0 ]; then
  fail create_release "release $TAG already exists (id=$(jq -r '.id | tostring' "$WORKDIR/exists.out")). Not modifying or deleting it."
fi
if ! grep -qi 'release not found' "$WORKDIR/exists.err"; then
  fail_api "$(cat "$WORKDIR/exists.err")" create_release
fi

jq -n \
  --arg tag "$TAG" \
  --arg sha "$SHA" \
  --arg name "$REL_NAME" \
  --arg body "$REL_BODY" \
  --argjson prerelease "$PRERELEASE" \
  '{tag_name:$tag,target_commitish:$sha,name:$name,body:$body,draft:true,prerelease:$prerelease,make_latest:"false"}' \
  > "$WORKDIR/create.json"

t0=$(now_ms)
set +e
gh api --method POST --input "$WORKDIR/create.json" "repos/$REPO/releases" >"$WORKDIR/create.out" 2>"$WORKDIR/create.err"
create_code=$?
set -e
if [ "$create_code" -ne 0 ]; then
  fail_api "$(cat "$WORKDIR/create.err"; printf '\n'; cat "$WORKDIR/create.out")" create_release
fi
CREATED_ID=$(jq -r '.id | tostring' "$WORKDIR/create.out")
case "$CREATED_ID" in
  ''|null) fail create_release "$(cat "$WORKDIR/create.out")" ;;
esac
note_timing create_release_ms "$(( $(now_ms) - t0 ))"
note_timing release_id "$CREATED_ID"
note_timing created_at "$(jq -r '.created_at | tostring' "$WORKDIR/create.out")"

t0=$(now_ms)
set +e
gh api --method POST \
  -H "Accept: application/vnd.github+json" \
  -H "Content-Type: video/mp4" \
  --input "$FILE" \
  "https://uploads.github.com/repos/$REPO/releases/$CREATED_ID/assets?name=$NAME" \
  >"$WORKDIR/upload.out" 2>"$WORKDIR/upload.err"
upload_code=$?
set -e
if [ "$upload_code" -ne 0 ]; then
  fail_api "$(cat "$WORKDIR/upload.err"; printf '\n'; cat "$WORKDIR/upload.out")" upload
fi
content_type=$(jq -r '.content_type // empty' "$WORKDIR/upload.out")
asset_state=$(jq -r '.state // empty' "$WORKDIR/upload.out")
asset_url=$(jq -r '.browser_download_url // empty' "$WORKDIR/upload.out")
if [ "$content_type" != "video/mp4" ] || [ "$asset_state" != "uploaded" ] || [ -z "$asset_url" ]; then
  fail upload "asset was not stored as an uploaded video/mp4. content_type=$content_type state=$asset_state url_present=$([ -n "$asset_url" ] && echo yes || echo no)"
fi
note_timing upload_ms "$(( $(now_ms) - t0 ))"
note_timing content_type "$content_type"

# Check the draft asset URL only. Requesting the stable URL before publish
# can leave a cached 404 that outlives the 60s poll.
draft_code=$(curl -sS -o "$WORKDIR/draft.body" -w '%{http_code}' --max-time 30 -H 'Cache-Control: no-cache' "$asset_url" 2>"$WORKDIR/draft.err" || true)
if [ "$draft_code" != "404" ]; then
  fail draft_visibility "anonymous draft asset URL was HTTP $draft_code before publish, expected 404. Refusing to publish. $(head -c 500 "$WORKDIR/draft.err" 2>/dev/null || true)"
fi
note_timing draft_http "$draft_code"

jq -n --argjson prerelease "$PRERELEASE" \
  '{draft:false,prerelease:$prerelease,make_latest:"false"}' > "$WORKDIR/patch.json"
t0=$(now_ms)
set +e
gh api --method PATCH --input "$WORKDIR/patch.json" "repos/$REPO/releases/$CREATED_ID" \
  >"$WORKDIR/patch.out" 2>"$WORKDIR/patch.err"
patch_code=$?
set -e
if [ "$patch_code" -ne 0 ]; then
  fail_api "$(cat "$WORKDIR/patch.err"; printf '\n'; cat "$WORKDIR/patch.out")" publish_release
fi
# jq's // operator treats false as empty, so draft=false must not use //.
draft_flag=$(jq -r '.draft | tostring' "$WORKDIR/patch.out")
latest_flag=$(jq -r '.make_latest | tostring' "$WORKDIR/patch.out")
if [ "$draft_flag" != "false" ]; then
  fail publish_release "release remained draft after PATCH. $(cat "$WORKDIR/patch.out")"
fi
CREATED_PUBLISHED=1
note_timing publish_release_ms "$(( $(now_ms) - t0 ))"
note_timing make_latest "$latest_flag"

deadline=$(( $(date +%s) + 60 ))
attempts=0
last_code=
last_sha=
ok=0
while [ "$(date +%s)" -lt "$deadline" ]; do
  attempts=$((attempts + 1))
  remain=$((deadline - $(date +%s)))
  if [ "$remain" -le 0 ]; then
    break
  fi
  if [ "$remain" -gt 20 ]; then
    remain=20
  fi
  set +e
  last_code=$(curl -sS -L -o "$WORKDIR/poll.body" -w '%{http_code}' --max-time "$remain" -H 'Cache-Control: no-cache' "$URL" 2>"$WORKDIR/poll.err")
  curl_code=$?
  set -e
  if [ "$curl_code" -ne 0 ]; then
    last_code="curl_$curl_code"
  fi
  if [ "$last_code" = "200" ]; then
    last_sha=$(sha256sum "$WORKDIR/poll.body" | awk '{print $1}' | tr '[:upper:]' '[:lower:]')
    if [ "$last_sha" = "$EXPECTED" ]; then
      ok=1
      break
    fi
  fi
  remain=$((deadline - $(date +%s)))
  if [ "$remain" -le 0 ]; then
    break
  fi
  sleep 2
done
note_timing poll_attempts "$attempts"
if [ "$ok" -ne 1 ]; then
  fail poll_url "anonymous stable URL did not return HTTP 200 with the expected sha256 within 60s. last_http=$last_code last_sha=$last_sha expected=$EXPECTED url=$URL"
fi

note_timing bytes "$bytes"
note_timing sha256 "$EXPECTED"
printf '%s\n' "$URL"
