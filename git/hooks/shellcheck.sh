#!/usr/bin/env bash
requirefns() {
  for fn in "$@"; do
    if [[ "$(type -t "$fn")" == function ]]; then
      continue
    else
      printf "%s function does not exist." "$fn"
      exit 1
    fi
  done
  return 0
}

requirefns isshellscript formatandcheck

checkshs() {
  local exts="$1"
  local ret=0
  local -a FILES

  mapfile -t FILES < <(git diff --cached --name-only --diff-filter=ACMR | grep -E "$exts" || true)

  for file in "${FILES[@]}"; do
    if [[ -n "$file" && -f "$file" ]] && isshellscript "$file"; then
      formatandcheck "$file"
      ret=$((ret + $?))
    fi
  done

  return "$ret"
}

checkexecs() {
  local ret=0
  local -a FILES dots

  mapfile -t FILES < <(git diff --cached --name-only --diff-filter=ACMR | grep -v '\.' || true)
  mapfile -t dots < <(git diff --cached --name-only --diff-filter=ACMR | grep '^\.' || true)

  FILES+=("${dots[@]}")

  for file in "${FILES[@]}"; do
    if [[ -n "$file" && -x "$file" && ! -d "$file" ]] && isshellscript "$file"; then
      formatandcheck "$file"
      ret=$((ret + $?))
    fi
  done

  return "$ret"
}
