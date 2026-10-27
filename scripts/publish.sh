#!/bin/sh
# Publish one issue: validate the brief files, refuse audio and extras, build, commit, and push.
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

# Refuse before build or git add. A non-whitelist file, an audio extension,
# or anything over 1 MB must not enter the public repository (CMP-225).
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
    *.m4a|*.mp3|*.wav|*.aac|*.ogg) append_reason "音频扩展名" ;;
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
  echo "拒绝发布 $DIR：这些文件不进仓库；音频按 CMP-225 走外链托管。" >&2
  cat "$scan_dir/hits" >&2
  echo "请把上述文件移出本期目录后再发布。m4a 等音频不提交进站点 git 仓库。" >&2
  rm -rf "$scan_dir"
  exit 1
fi
rm -rf "$scan_dir"

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
