#!/bin/sh
# Publish one issue: validate the brief files, refuse audio, video, and extras, build, commit, and push.
# If this date has a GitHub Release video-YYYY-MM-DD or a local video-markers/YYYY-MM-DD file,
# index.html must already contain that date's player and the disclosure sentence.
# Usage: scripts/publish.sh YYYY-MM-DD [--no-push]
set -eu
ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
cd "$ROOT"

# briefs/$DATE may only contain these files. 1 MB = 1048576 bytes.
BRIEF_FILE_MAX_BYTES=1048576

append_reason() {
  if [ -n "$reasons" ]; then
    reasons="$reasons，$1"
  else
    reasons=$1
  fi
}

refuse_indexed_media() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    return 0
  fi
  indexed=$(git ls-files | grep -Ei '\.(m4a|mp3|aac|wav|ogg|flac|m4b|mp4|webm|mov|mkv|m4v)$' || true)
  if [ -z "$indexed" ]; then
    return 0
  fi
  echo "拒绝发布：暂存区有影音文件，不提交进站点 git。" >&2
  echo "error_stage=staged_media" >&2
  printf '%s\n' "$indexed" | while IFS= read -r staged || [ -n "${staged:-}" ]; do
    [ -n "${staged:-}" ] || continue
    printf '%s\n' "- $staged" >&2
  done
  exit 1
}

require_video_player_if_needed() {
  basis=""
  if [ -f "video-markers/$DATE" ]; then
    basis="视频产物标记 video-markers/$DATE"
  fi

  do_lookup=0
  case "${AI_DAILY_VIDEO_LOOKUP:-auto}" in
    1|true|yes) do_lookup=1 ;;
    0|false|no) do_lookup=0 ;;
    *)
      origin_url=$(git remote get-url origin 2>/dev/null || true)
      case "$origin_url" in
        *github.com*) do_lookup=1 ;;
      esac
      ;;
  esac

  if [ "$do_lookup" -eq 1 ]; then
    if ! command -v gh >/dev/null 2>&1; then
      echo "error_stage=release_lookup" >&2
      echo "拒绝发布 $DIR：需要 gh 才能确认视频 Release 是否存在，已停止。" >&2
      exit 1
    fi
    lookup_dir=$(mktemp -d)
    set +e
    NO_COLOR=1 GH_FORCE_TTY=0 GH_PROMPT_DISABLED=1 \
      env -u FORCE_COLOR \
      gh release view "video-$DATE" --repo "${AI_DAILY_REPO:-fengqiaozhu/ai-daily-brief}" \
      --json id,tagName,isDraft >"$lookup_dir/rel.json" 2>"$lookup_dir/rel.err"
    rel_code=$?
    set -e
    if [ "$rel_code" -eq 0 ]; then
      if [ -n "$basis" ]; then
        basis="$basis；视频 Release video-$DATE"
      else
        basis="视频 Release video-$DATE"
      fi
    elif grep -qi 'release not found' "$lookup_dir/rel.err"; then
      :
    else
      echo "error_stage=release_lookup" >&2
      echo "拒绝发布 $DIR：无法确认视频 Release 是否存在，已停止，避免在不确定时放行。" >&2
      cat "$lookup_dir/rel.err" >&2
      rm -rf "$lookup_dir"
      exit 1
    fi
    rm -rf "$lookup_dir"
  fi

  if [ -z "$basis" ]; then
    return 0
  fi

  set +e
  check_out=$(python3 scripts/inject-episode-video.py --check "$DATE" --html "$DIR/index.html" --repo "${AI_DAILY_REPO:-fengqiaozhu/ai-daily-brief}" 2>&1)
  check_code=$?
  set -e
  if [ "$check_code" -ne 0 ]; then
    echo "error_stage=video_html" >&2
    echo "拒绝发布 $DIR：该期已有视频，但 index.html 未包含对应播放器。未改页面，未提交，未推送。" >&2
    echo "依据：$basis" >&2
    printf '%s\n' "$check_out" >&2
    echo "补上播放器：python3 scripts/inject-episode-video.py $DATE" >&2
    exit 1
  fi
}

DATE=${1:-}
if [ -z "$DATE" ]; then
  echo "usage: scripts/publish.sh YYYY-MM-DD [--no-push]" >&2
  exit 2
fi
NO_PUSH=0
if [ "${2:-}" = "--no-push" ]; then
  NO_PUSH=1
fi
case "$DATE" in
  [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) ;;
  *) echo "date must look like YYYY-MM-DD" >&2; exit 2 ;;
esac

DIR="briefs/$DATE"
for f in index.md index.html sources.md; do
  if [ ! -f "$DIR/$f" ]; then
    echo "missing $DIR/$f" >&2
    echo "程心需放入这三份文件后再发布。本脚本不生成早报正文。" >&2
    exit 1
  fi
done

# Refuse before build or git add. A non-whitelist file, an audio or video
# extension, or anything over 1 MB must not enter the public repository.
scan_dir=$(mktemp -d)
find "$DIR" \( -type f -o -type l \) > "$scan_dir/files"
: > "$scan_dir/hits"
while IFS= read -r path || [ -n "${path:-}" ]; do
  [ -n "${path:-}" ] || continue
  rel=${path#"$DIR"/}
  reasons=""
  case "$rel" in
    index.md|index.html|sources.md|blurb.txt) ;;
    *) append_reason "非白名单" ;;
  esac
  lower=$(printf '%s' "$rel" | tr '[:upper:]' '[:lower:]')
  case "$lower" in
    *.m4a|*.mp3|*.wav|*.aac|*.ogg|*.flac|*.m4b) append_reason "音频扩展名" ;;
    *.mp4|*.webm|*.mov|*.mkv|*.m4v) append_reason "视频扩展名" ;;
  esac
  if bytes=$(wc -c < "$path" 2>/dev/null); then
    bytes=$(printf '%s' "$bytes" | tr -d '[:space:]')
    case "$bytes" in
      ''|*[!0-9]*) bytes=0 ;;
    esac
    if [ "$bytes" -gt "$BRIEF_FILE_MAX_BYTES" ]; then
      append_reason "超过 1 MB（${bytes} 字节）"
    fi
  else
    append_reason "无法读取"
  fi
  if [ -n "$reasons" ]; then
    printf '%s\n' "- $path：$reasons" >> "$scan_dir/hits"
  fi
done < "$scan_dir/files"
if [ -s "$scan_dir/hits" ]; then
  echo "拒绝发布 $DIR：这些文件不进仓库。音频与视频走 GitHub Releases 外链，不提交进站点 git。" >&2
  cat "$scan_dir/hits" >&2
  echo "请把上述文件移出本期目录后再发布。mp4、m4a 等影音文件不提交进站点 git 仓库。" >&2
  rm -rf "$scan_dir"
  exit 1
fi
rm -rf "$scan_dir"

refuse_indexed_media
require_video_player_if_needed

python3 scripts/build.py --root "$ROOT"
echo "built dist/"

if [ "$NO_PUSH" -eq 1 ]; then
  echo "local build only; not pushed"
  exit 0
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "not a git checkout; built dist/ only" >&2
  exit 1
fi

git add -- "$DIR/index.md" "$DIR/index.html" "$DIR/sources.md"
if [ -f "$DIR/blurb.txt" ]; then
  git add -- "$DIR/blurb.txt"
fi
git add -- site.json scripts README.md .github
if [ -d docs ]; then
  git add -- docs
fi
refuse_indexed_media
if git diff --cached --quiet; then
  echo "no content changes to commit"
else
  git -c user.name="${GIT_AUTHOR_NAME:-小小工作室}" \
      -c user.email="${GIT_AUTHOR_EMAIL:-ai-daily-brief@users.noreply.paperclip.ing}" \
      commit -m "publish $DATE

Co-Authored-By: Paperclip <noreply@paperclip.ing>"
fi

git push origin HEAD
echo "pushed. GitHub Actions deploys Pages from this push."
echo "rollback this issue with: git rm -r briefs/$DATE && git commit -m \"unpublish $DATE\" && git push"
