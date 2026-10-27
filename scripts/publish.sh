#!/bin/sh
# Publish one issue: validate the three content files, build, commit, and push.
# Usage: scripts/publish.sh YYYY-MM-DD [--no-push]
set -eu
ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
cd "$ROOT"

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

git add "$DIR" site.json scripts README.md .github
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
