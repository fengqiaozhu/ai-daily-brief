#!/bin/sh
# Offline failure paths for publish-video.sh. A fake gh must not be called.
set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
TMP=$(mktemp -d)
cleanup() { rm -rf "$TMP"; }
trap cleanup EXIT

mkdir -p "$TMP/src" "$TMP/fakebin" "$TMP/outside"
tar -C "$ROOT" --exclude .git --exclude dist -cf - . | tar -C "$TMP/src" -xf -
cd "$TMP/src"

cat > "$TMP/fakebin/gh" <<'EOF'
#!/bin/sh
echo "$0 $*" >> "${GH_CALL_LOG:?}"
echo "gh-should-not-run" >&2
exit 99
EOF
chmod +x "$TMP/fakebin/gh"
: > "$TMP/gh-calls"
export PATH="$TMP/fakebin:$PATH"
export GH_CALL_LOG="$TMP/gh-calls"

fail() { echo "FAIL: $1" >&2; exit 1; }

assert_stage() {
  label=$1
  want=$2
  got=$3
  echo "== $label =="
  echo "exit=$got"
  cat "$TMP/err"
  test "$got" -ne 0 || fail "$label exited 0"
  jq -e --arg stage "$want" '.ok == false and .stage == $stage and (.error | length > 0)' "$TMP/err" >/dev/null \
    || fail "$label json"
  test ! -s "$TMP/gh-calls" || fail "$label called gh"
  : > "$TMP/gh-calls"
}

set +e
sh scripts/publish-video.sh >"$TMP/out" 2>"$TMP/err"
code=$?
set -e
assert_stage "missing args" args "$code"
test ! -s "$TMP/out" || fail "args wrote stdout"

SHA_BAD=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
set +e
sh scripts/publish-video.sh 2099-12-30 --file "$TMP/outside/missing-src.mp4" --sha256 "$SHA_BAD" >"$TMP/out" 2>"$TMP/err"
code=$?
set -e
assert_stage "missing file" file "$code"

printf 'tiny\n' > "$TMP/src/inside.mp4"
set +e
sh scripts/publish-video.sh 2099-12-30 --file "$TMP/src/inside.mp4" --sha256 "$SHA_BAD" >"$TMP/out" 2>"$TMP/err"
code=$?
set -e
assert_stage "file inside repo" file_location "$code"
rm -f "$TMP/src/inside.mp4"

printf 'tiny\n' > "$TMP/outside/tiny.mp4"
set +e
sh scripts/publish-video.sh 2099-12-30 --file "$TMP/outside/tiny.mp4" --sha256 "$SHA_BAD" >"$TMP/out" 2>"$TMP/err"
code=$?
set -e
assert_stage "sha mismatch" sha256_local "$code"
grep -F "expected=$SHA_BAD" "$TMP/err" >/dev/null || fail "sha error omitted the expected hash"
# assert_stage already truncated the log; re-read is fine because the last err file remains.
# gh log was cleared by assert_stage. Confirm the cleared call was empty before clear by the assertion.

if truncate -s 1610612736 "$TMP/outside/big.mp4" 2>/dev/null; then
  blocks=$(du -k "$TMP/outside/big.mp4" | awk '{print $1}')
  if [ "$blocks" -lt 10240 ]; then
    set +e
    sh scripts/publish-video.sh 2099-12-30 --file "$TMP/outside/big.mp4" --sha256 "$SHA_BAD" >"$TMP/out" 2>"$TMP/err"
    code=$?
    set -e
    assert_stage "size limit" size_limit "$code"
    grep -F "1610612736" "$TMP/err" >/dev/null || fail "size limit omitted the threshold"
  else
    echo "SKIP size limit: truncate was not sparse (${blocks} KB)"
    rm -f "$TMP/outside/big.mp4"
  fi
else
  echo "SKIP size limit: truncate unavailable"
fi

# jq's // treats JSON false as empty. Publishing checks draft=false with tostring.
draft_flag=$(printf '%s' '{"draft":false}' | jq -r '.draft | tostring')
test "$draft_flag" = "false" || fail "jq tostring lost draft=false"
false_as_empty=$(printf '%s' '{"draft":false}' | jq -r '.draft // "empty"')
test "$false_as_empty" = "empty" || fail "expected // to treat false as empty"

echo "ALL_OK"
