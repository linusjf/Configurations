#!/usr/bin/env bash

optimize() {
  local file="$1"
  local mode
  mode=$(stat -c "%a" "$file")
  jpegoptim -f -s "$file" \
    && hash=$(git hash-object -w "${file}") \
    && git update-index --add --cacheinfo "100${mode}" "$hash" "$file" || exit 1
  return $?
}

optimizejpgs() {
  local ret=0
  local exts
  exts=".*\.(jpg|jpeg)$"
  local cmd
  cmd="git diff --cached --name-only --diff-filter=ACMR | grep -E \"$exts\""

  readarray -t FILES < <(eval "$cmd")
  ret=$?

  if [[ ${#FILES[@]} -eq 0 ]]; then return 0; fi

  for file in "${FILES[@]}"; do
    optimize "$file"
    ret=$((ret + $?))
  done

  return "$ret"
}
