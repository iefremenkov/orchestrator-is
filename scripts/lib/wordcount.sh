#!/usr/bin/env bash

wordcount() {
  printf '%s\n' "${1-}" | awk '{ count += NF } END { print count + 0 }'
}
