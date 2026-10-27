#!/bin/sh
# Proves publish.sh refuses audio/video/extra/oversize files and stages only the whitelist.
# Runs in a throwaway clone whose origin is a local bare repo.
set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
TMP=$(mktemp -d)
cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

mkdir -p "$TMP/src"
tar -C "$ROOT" --exclude .git --exclude dist -cf - . | tar -C "$TMP/src" -xf -
cd "$TMP/src"
git init -q
git symbolic-ref HEAD refs/heads/main
git -c user.name=test -c user.email=test@example.com add .
git -c user.name=test -c user.email=test@example.com commit -m "base" >/dev/null
git init -q --bare "$TMP/origin.git"
git remote add origin "$TMP/origin.git"
git push -u origin HEAD >/dev/null

origin_url=$(git remote get-url origin)
case "$origin_url" in
  *github.com*) echo "refusing to test against GitHub: $origin_url" >&2; exit 1 ;;
esac

make_brief() {
  d=$1
  mkdir -p "briefs/$d"
  printf '# 测试\n\n不是对外正文。\n' > "briefs/$d/index.md"
  printf '<!DOCTYPE html><html><body><p>测试</p></body></html>\n' > "briefs/$d/index.html"
  printf '# 来源\n\n- [示例](https://example.com)\n' > "briefs/$d/sources.md"
  printf '一句话\n' > "briefs/$d/blurb.txt"
}

echo "== dirty brief: 9MB fake m4a plus notes.tmp =="
make_brief 2099-01-01
mkdir -p briefs/2099-01-01/audio
dd if=/dev/zero of=briefs/2099-01-01/audio/fake.m4a bs=1048576 count=9 >/dev/null 2>&1
printf 'temp\n' > briefs/2099-01-01/notes.tmp
before=$(git rev-parse HEAD)

set +e
sh scripts/publish.sh 2099-01-01 --no-push >"$TMP/nopush.out" 2>"$TMP/nopush.err"
nopush_code=$?
sh scripts/publish.sh 2099-01-01 >"$TMP/push.out" 2>"$TMP/push.err"
push_code=$?
set -e
after=$(git rev-parse HEAD)
git status --short --untracked-files=all > "$TMP/dirty-status.txt"
git diff --cached --name-only > "$TMP/dirty-cached.txt"

echo "command: sh scripts/publish.sh 2099-01-01 --no-push"
echo "exit: $nopush_code"
echo "stderr:"
cat "$TMP/nopush.err"
echo "stdout:"
cat "$TMP/nopush.out"
echo "command: sh scripts/publish.sh 2099-01-01"
echo "exit: $push_code"
echo "stderr:"
cat "$TMP/push.err"
echo "stdout:"
cat "$TMP/push.out"
echo "git status --short --untracked-files=all:"
cat "$TMP/dirty-status.txt"
echo "git diff --cached --name-only:"
cat "$TMP/dirty-cached.txt"
echo "HEAD before=$before after=$after"

fail() { echo "FAIL: $1" >&2; exit 1; }
test "$nopush_code" -ne 0 || fail "dirty --no-push exit"
test "$push_code" -ne 0 || fail "dirty publish exit"
test "$before" = "$after" || fail "HEAD moved"
grep -F "这些文件不进仓库。音频与视频走 GitHub Releases 外链，不提交进站点 git。" "$TMP/nopush.err" >/dev/null || fail "nopush warning"
grep -F "这些文件不进仓库。音频与视频走 GitHub Releases 外链，不提交进站点 git。" "$TMP/push.err" >/dev/null || fail "push warning"
grep -F "fake.m4a" "$TMP/nopush.err" >/dev/null || fail "nopush missing m4a"
grep -F "notes.tmp" "$TMP/nopush.err" >/dev/null || fail "nopush missing notes"
if grep -F "fake.m4a" "$TMP/dirty-status.txt" >/dev/null; then
  fail "gitignore failed to hide fake.m4a from status"
fi
git check-ignore -q briefs/2099-01-01/audio/fake.m4a || fail "gitignore missed fake.m4a"
test ! -s "$TMP/dirty-cached.txt" || fail "index was not empty"
if git ls-files | grep -q "fake.m4a"; then
  echo "fake audio was staged into the index" >&2
  exit 1
fi

echo "== clean brief: --no-push then real commit to local origin =="
rm -rf briefs/2099-01-01
make_brief 2099-01-02
set +e
sh scripts/publish.sh 2099-01-02 --no-push >"$TMP/clean-nopush.out" 2>"$TMP/clean-nopush.err"
clean_nopush_code=$?
sh scripts/publish.sh 2099-01-02 >"$TMP/clean-push.out" 2>"$TMP/clean-push.err"
clean_push_code=$?
set -e
echo "command: sh scripts/publish.sh 2099-01-02 --no-push"
echo "exit: $clean_nopush_code"
echo "stdout:"
cat "$TMP/clean-nopush.out"
echo "stderr:"
cat "$TMP/clean-nopush.err"
echo "command: sh scripts/publish.sh 2099-01-02"
echo "exit: $clean_push_code"
echo "stdout:"
cat "$TMP/clean-push.out"
echo "stderr:"
cat "$TMP/clean-push.err"
echo "git ls-tree briefs/2099-01-02:"
git ls-tree -r --name-only HEAD briefs/2099-01-02 | sort | tee "$TMP/tree.txt"
echo "git status --short after clean publish:"
git status --short | tee "$TMP/clean-status.txt"
echo "git show --stat --oneline HEAD:"
git show --stat --oneline HEAD

test "$clean_nopush_code" -eq 0 || fail "clean --no-push"
grep -F "local build only; not pushed" "$TMP/clean-nopush.out" >/dev/null || fail "clean preview text"
test "$clean_push_code" -eq 0 || fail "clean publish"
grep -F 'rollback this issue with: git rm -r briefs/2099-01-02 && git commit -m "unpublish 2099-01-02" && git push' "$TMP/clean-push.out" >/dev/null || fail "rollback text"
printf '%s\n' \
  briefs/2099-01-02/blurb.txt \
  briefs/2099-01-02/index.html \
  briefs/2099-01-02/index.md \
  briefs/2099-01-02/sources.md | sort > "$TMP/expect.txt"
diff -u "$TMP/expect.txt" "$TMP/tree.txt"
test ! -s "$TMP/clean-status.txt"

echo "== small non-whitelist file is also refused =="
make_brief 2099-01-03
printf 'x\n' > briefs/2099-01-03/draft.bak
set +e
sh scripts/publish.sh 2099-01-03 --no-push >"$TMP/extra.out" 2>"$TMP/extra.err"
extra_code=$?
set -e
echo "command: sh scripts/publish.sh 2099-01-03 --no-push"
echo "exit: $extra_code"
cat "$TMP/extra.err"
test "$extra_code" -ne 0 || fail "extra file was accepted"
grep -F "非白名单" "$TMP/extra.err" >/dev/null || fail "extra file reason"
if git ls-files | grep -q "draft.bak"; then
  echo "draft.bak was indexed" >&2
  exit 1
fi

echo "== oversize whitelist file is refused =="
make_brief 2099-01-04
dd if=/dev/zero bs=1048576 count=2 >> briefs/2099-01-04/index.md 2>/dev/null
set +e
sh scripts/publish.sh 2099-01-04 --no-push >"$TMP/big.out" 2>"$TMP/big.err"
big_code=$?
set -e
echo "command: sh scripts/publish.sh 2099-01-04 --no-push"
echo "exit: $big_code"
cat "$TMP/big.err"
test "$big_code" -ne 0 || fail "oversize file was accepted"
grep -F "超过 1 MB" "$TMP/big.err" >/dev/null || fail "oversize reason"

echo "== uppercase audio extension is refused =="
make_brief 2099-01-05
printf 'x' > briefs/2099-01-05/clip.MP3
set +e
sh scripts/publish.sh 2099-01-05 --no-push >"$TMP/mp3.out" 2>"$TMP/mp3.err"
mp3_code=$?
set -e
echo "command: sh scripts/publish.sh 2099-01-05 --no-push"
echo "exit: $mp3_code"
cat "$TMP/mp3.err"
test "$mp3_code" -ne 0 || fail "uppercase audio was accepted"
grep -F "音频扩展名" "$TMP/mp3.err" >/dev/null || fail "audio reason"

echo "== video extension is refused =="
make_brief 2099-01-06
printf 'x' > briefs/2099-01-06/clip.mp4
set +e
sh scripts/publish.sh 2099-01-06 --no-push >"$TMP/mp4.out" 2>"$TMP/mp4.err"
mp4_code=$?
set -e
echo "command: sh scripts/publish.sh 2099-01-06 --no-push"
echo "exit: $mp4_code"
cat "$TMP/mp4.err"
test "$mp4_code" -ne 0 || fail "mp4 was accepted"
grep -F "视频扩展名" "$TMP/mp4.err" >/dev/null || fail "video reason"
grep -F "非白名单" "$TMP/mp4.err" >/dev/null || fail "mp4 whitelist reason"

echo "== uppercase video extension is refused =="
make_brief 2099-01-07
printf 'x' > briefs/2099-01-07/clip.MP4
set +e
sh scripts/publish.sh 2099-01-07 --no-push >"$TMP/MP4.out" 2>"$TMP/MP4.err"
MP4_code=$?
set -e
test "$MP4_code" -ne 0 || fail "uppercase mp4 was accepted"
grep -F "视频扩展名" "$TMP/MP4.err" >/dev/null || fail "uppercase video reason"

echo "== gitignore and CI pattern keep mp4 out of the index =="
printf 'x' > stray.mp4
git check-ignore -q stray.mp4 || fail "gitignore missed mp4"
set +e
git add -- stray.mp4 >"$TMP/add.out" 2>"$TMP/add.err"
add_code=$?
set -e
git diff --cached --name-only > "$TMP/add-cached.txt"
if grep -F "stray.mp4" "$TMP/add-cached.txt" >/dev/null; then
  fail "git add staged an ignored mp4"
fi
test "$add_code" -ne 0 || fail "git add of an ignored mp4 exited 0"
git add -f -- stray.mp4
if git ls-files | grep -Ei '\.(m4a|mp3|aac|wav|ogg|flac|m4b|mp4|webm|mov|mkv|m4v)$' >/dev/null; then
  echo "ci pattern matched forced mp4"
else
  fail "ci pattern missed mp4"
fi
git rm --cached -q -- stray.mp4
rm -f stray.mp4

echo "ALL_OK origin=$origin_url"
