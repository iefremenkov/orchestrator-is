#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

source scripts/lib/wordcount.sh

assert_wordcount() {
  local input=$1
  local expected=$2
  local actual

  actual=$(wordcount "$input")
  if [[ $actual != "$expected" ]]; then
    printf 'wordcount %q: expected %q, got %q\n' \
      "$input" "$expected" "$actual" >&2
    return 1
  fi
}

assert_wordcount 'hello world' '2'
assert_wordcount '  a   b c  ' '3'
assert_wordcount '' '0'
