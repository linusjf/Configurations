#!/usr/bin/env bash

checkshs() {
  local exts="$1"
  local ret=0
  cmd="git diff --cached --name-only --diff-filter=ACMR | grep $exts"
  readarray -t FILES < <(eval "$cmd")
  ret=$((ret + $?))
  for file in "${FILES[@]}"; do
    if isshellscript "$file"; then
      formatandcheck "$file"
      ret=$((ret + $?))
    fi
  done
  return "$ret"
}

checkexecs() {
  local ret=0
  cmd="git diff --cached --name-only --diff-filter=ACMR | grep -v '\.'"
  readarray -t FILES < <(eval "$cmd")
  ret=$((ret + $?))
  cmd="git diff --cached --name-only --diff-filter=ACMR | grep '^\.'"
  readarray -t dots < <(eval "$cmd")
  ret=$((ret + $?))
  FILES+=("${dots[@]}")
  for file in "${FILES[@]}"; do
    if test -x "$file" && test ! -d "$file" && isshellscript "$file"; then
      formatandcheck "$file"
      ret=$((ret + $?))
    fi
  done
  return "$ret"
}
