#!/usr/bin/env bash

requirefns ismarkdownfile

lint_markdown() {
  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep -E '\.md$')

  if [[ ${#files[@]} -eq 0 ]]; then
    return 0
  fi

  local ret=0
  for file in "${files[@]}"; do
    if ismarkdownfile "$file"; then
      markdownlint "$file" || ret=$((ret + 1))
    fi
  done

  return "$ret"
}
