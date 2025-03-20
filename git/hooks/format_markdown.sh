#!/usr/bin/env bash

requirefns format_file

format_markdown() {
  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep -E '\.md$')

  if [[ ${#files[@]} -eq 0 ]]; then
    return 0
  fi

  for file in "${files[@]}"; do
    format_file "$file" prettier --parser markdown --log-level silent --write
  done

  return 0
}
