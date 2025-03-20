#!/usr/bin/env bash

format_markdown() {
  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep -E '\.md$')

  if [[ ${#files[@]} -eq 0 ]]; then
    return 0
  fi

  for file in "${files[@]}"; do
    prettier --parser markdown --write "$file"
  done

  return 0
}
