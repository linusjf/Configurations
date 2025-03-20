#!/usr/bin/env bash
requirefns isshellscript formatandcheck

checkshs() {
  # Regexp for grep to only choose sh file extension for checking
  local exts="\.sh$"
  local ret=0

  local -a files=()
  mapfile -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep -E "$exts" || true)

  for file in "${files[@]}"; do
    if [[ -n "$file" && -f "$file" ]] && isshellscript "$file"; then
      formatandcheck "$file"
      ret=$((ret + $?))
    fi
  done

  return "$ret"
}

checkexecs() {
  local ret=0
  local -a dots=()

  local -a files=()
  mapfile -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep -v '\.' || true)
  mapfile -t dots < <(git diff --cached --name-only --diff-filter=ACMR | grep '^\.' || true)

  files+=("${dots[@]}")

  for file in "${files[@]}"; do
    if [[ -n "$file" && -x "$file" && ! -d "$file" ]] && isshellscript "$file"; then
      formatandcheck "$file"
      ret=$((ret + $?))
    fi
  done

  return "$ret"
}
