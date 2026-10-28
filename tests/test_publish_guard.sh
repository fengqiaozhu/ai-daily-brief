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

echo "== staged mp4 is refused before build or push =="
make_brief 2099-01-08
printf 'x' > forced-into-index.mp4
git add -f -- forced-into-index.mp4
before=$(git rev-parse HEAD)
set +e
sh scripts/publish.sh 2099-01-08 --no-push >"$TMP/staged-nopush.out" 2>"$TMP/staged-nopush.err"
staged_nopush=$?
sh scripts/publish.sh 2099-01-08 >"$TMP/staged-push.out" 2>"$TMP/staged-push.err"
staged_push=$?
set -e
after=$(git rev-parse HEAD)
echo "exit nopush=$staged_nopush push=$staged_push"
cat "$TMP/staged-nopush.err"
test "$staged_nopush" -ne 0 || fail "staged mp4 --no-push was accepted"
test "$staged_push" -ne 0 || fail "staged mp4 publish was accepted"
test "$before" = "$after" || fail "HEAD moved while a staged mp4 was present"
grep -F "error_stage=staged_media" "$TMP/staged-nopush.err" >/dev/null || fail "staged stage"
grep -F "forced-into-index.mp4" "$TMP/staged-nopush.err" >/dev/null || fail "staged filename"
grep -F "built dist/" "$TMP/staged-nopush.out" >/dev/null && fail "staged mp4 still built"
git rm --cached -q -- forced-into-index.mp4
rm -f forced-into-index.mp4

echo "== video marker without a player is refused =="
make_brief 2099-01-09
mkdir -p video-markers
printf 'marker\n' > video-markers/2099-01-09
html_before=$(sha256sum briefs/2099-01-09/index.html | awk '{print $1}')
before=$(git rev-parse HEAD)
set +e
sh scripts/publish.sh 2099-01-09 --no-push >"$TMP/marker.out" 2>"$TMP/marker.err"
marker_code=$?
sh scripts/publish.sh 2099-01-09 >"$TMP/marker-push.out" 2>"$TMP/marker-push.err"
marker_push=$?
set -e
after=$(git rev-parse HEAD)
html_after=$(sha256sum briefs/2099-01-09/index.html | awk '{print $1}')
echo "exit nopush=$marker_code push=$marker_push"
cat "$TMP/marker.err"
test "$marker_code" -ne 0 || fail "marker without player was accepted"
test "$marker_push" -ne 0 || fail "marker push was accepted"
test "$before" = "$after" || fail "HEAD moved for a missing player"
test "$html_before" = "$html_after" || fail "html changed when the player was missing"
grep -F "error_stage=video_html" "$TMP/marker.err" >/dev/null || fail "video_html stage"
grep -F "video-2099-01-09/ai-daily-2099-01-09.mp4" "$TMP/marker.err" >/dev/null || fail "missing url"
grep -F "本期视频由 AI 生成，内容以图文版为准。" "$TMP/marker.err" >/dev/null || fail "missing disclosure"
grep -F "视频产物标记 video-markers/2099-01-09" "$TMP/marker.err" >/dev/null || fail "marker basis"
grep -F "built dist/" "$TMP/marker.out" >/dev/null && fail "missing player still built"

echo "== another date's player does not satisfy this date =="
make_brief 2099-01-11
other='<video controls src="https://github.com/fengqiaozhu/ai-daily-brief/releases/download/video-2099-01-01/ai-daily-2099-01-01.mp4"></video><p>本期视频由 AI 生成，内容以图文版为准。</p>'
printf '%s\n' "$other" >> briefs/2099-01-11/index.html
printf 'marker\n' > video-markers/2099-01-11
set +e
sh scripts/publish.sh 2099-01-11 --no-push >"$TMP/other.out" 2>"$TMP/other.err"
other_code=$?
set -e
echo "exit=$other_code"
cat "$TMP/other.err"
test "$other_code" -ne 0 || fail "other date player was accepted"
grep -F "video-2099-01-11/ai-daily-2099-01-11.mp4" "$TMP/other.err" >/dev/null || fail "did not name this date"
grep -F "video-2099-01-01/ai-daily-2099-01-01.mp4" briefs/2099-01-11/index.html >/dev/null || fail "other player was removed"
if grep -F "缺少：披露语" "$TMP/other.err" >/dev/null; then
  fail "disclosure from the other player was reported missing"
fi

echo "== marker plus the matching player is accepted =="
make_brief 2099-01-10
cat > briefs/2099-01-10/index.html <<'EOF'
<!DOCTYPE html><html><body>
<div class="wrap">
<header class="mast"><h1>测试</h1></header>
<nav class="toc"><a href="#x">目录</a></nav>
</div>
</body></html>
EOF
python3 scripts/inject-episode-video.py 2099-01-10 --html briefs/2099-01-10/index.html --theme light >/dev/null
printf 'marker\n' > video-markers/2099-01-10
set +e
sh scripts/publish.sh 2099-01-10 --no-push >"$TMP/player.out" 2>"$TMP/player.err"
player_code=$?
set -e
echo "exit=$player_code"
cat "$TMP/player.err"
cat "$TMP/player.out"
test "$player_code" -eq 0 || fail "matching player was refused"
grep -F "local build only; not pushed" "$TMP/player.out" >/dev/null || fail "player preview text"
python3 scripts/inject-episode-video.py --check 2099-01-10 --html briefs/2099-01-10/index.html >/dev/null

echo "== release lookup stays off for a non-GitHub origin =="
make_brief 2099-01-13
mkdir -p "$TMP/fakebin"
cat > "$TMP/fakebin/gh" <<'EOF'
#!/bin/sh
echo called >> "${GH_CALL_LOG:?}"
echo "gh-called" >&2
exit 99
EOF
chmod +x "$TMP/fakebin/gh"
: > "$TMP/gh-calls"
set +e
env PATH="$TMP/fakebin:$PATH" GH_CALL_LOG="$TMP/gh-calls" \
  sh scripts/publish.sh 2099-01-13 --no-push >"$TMP/offline.out" 2>"$TMP/offline.err"
offline_code=$?
set -e
echo "exit=$offline_code"
cat "$TMP/offline.err"
test "$offline_code" -eq 0 || fail "offline publish called gh or failed"
test ! -s "$TMP/gh-calls" || fail "gh was called for a local origin"

echo "== a missing release does not require a player =="
cat > "$TMP/fakebin/gh" <<'EOF'
#!/bin/sh
echo called >> "${GH_CALL_LOG:?}"
echo "release not found" >&2
exit 1
EOF
chmod +x "$TMP/fakebin/gh"
: > "$TMP/gh-calls"
make_brief 2099-01-14
set +e
env PATH="$TMP/fakebin:$PATH" GH_CALL_LOG="$TMP/gh-calls" AI_DAILY_VIDEO_LOOKUP=1 \
  sh scripts/publish.sh 2099-01-14 --no-push >"$TMP/absent.out" 2>"$TMP/absent.err"
absent_code=$?
set -e
echo "exit=$absent_code"
cat "$TMP/absent.err"
test "$absent_code" -eq 0 || fail "absent release was treated as required"
test -s "$TMP/gh-calls" || fail "lookup did not run"

echo "== a release lookup error stops publish =="
cat > "$TMP/fakebin/gh" <<'EOF'
#!/bin/sh
echo called >> "${GH_CALL_LOG:?}"
echo "HTTP 401: Bad credentials" >&2
exit 1
EOF
chmod +x "$TMP/fakebin/gh"
: > "$TMP/gh-calls"
make_brief 2099-01-15
before=$(git rev-parse HEAD)
set +e
env PATH="$TMP/fakebin:$PATH" GH_CALL_LOG="$TMP/gh-calls" AI_DAILY_VIDEO_LOOKUP=1 \
  sh scripts/publish.sh 2099-01-15 --no-push >"$TMP/lookup.out" 2>"$TMP/lookup.err"
lookup_code=$?
set -e
after=$(git rev-parse HEAD)
echo "exit=$lookup_code"
cat "$TMP/lookup.err"
test "$lookup_code" -ne 0 || fail "lookup error was ignored"
test "$before" = "$after" || fail "HEAD moved after lookup error"
grep -F "error_stage=release_lookup" "$TMP/lookup.err" >/dev/null || fail "lookup stage"
grep -F "HTTP 401: Bad credentials" "$TMP/lookup.err" >/dev/null || fail "raw lookup error"
grep -F "built dist/" "$TMP/lookup.out" >/dev/null && fail "lookup error still built"

echo "ALL_OK origin=$origin_url"
