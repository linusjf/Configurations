#!/usr/bin/env bash
requirefns ismarkdownfile formatandcheckmd

checkmds() {
  # Regexp for grep to only choose md file extension for checking
  local exts="\.md$"
  local ret=0

  local -a files=()
  mapfile -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep -E "$exts" || true)

  for file in "${files[@]}"; do
    if [[ -n "$file" && -f "$file" ]] && ismarkdownfile "$file"; then
      formatandcheckmd "$file"
      ret=$((ret + $?))
    fi
  done

  return "$ret"
}
