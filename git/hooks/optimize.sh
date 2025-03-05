#!/usr/bin/env bash

optimize() {
  file="$1"
  mode=$(stat -c "%a" "$file")
  jpegoptim -f -s "$file" \
    && hash=$(git hash-object -w "${file}") \
    &&
    # Add it back to index \
    git update-index --add --cacheinfo "100${mode}" "$hash" "$file" || exit 1
  return $?
}

optimizejpgs() {
  local ret=0
  exts="'.*(\.jpg$|\.jpeg$)'"
  cmd="git diff --cached --name-only --diff-filter=ACMR | grep -o -E $exts"
  readarray -t files < <(eval "$cmd")
  ret=$((ret + $?))
  for file in "${files[@]}"; do
    optimize "$file"
    ret=$((ret + $?))
  done
  return "$ret"
}
