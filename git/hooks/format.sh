#!/usr/bin/env bash
get_mode() {
  local file="$1"
  local mode="644"
  if [ -x "$file" ]; then
    mode="755"
  fi
  printf "%s" "$mode"
}

format_file() {
  local file="$1"
  local formatter="$2"
  local tmp_file
  tmp_file="$(mktemp)"

  git show ":$file" > "$tmp_file"
  "$formatter" "$tmp_file"
  local hash
  hash=$(git hash-object -w "$tmp_file")
  local mode
  mode=$(get_mode "$file")
  git update-index --add --cacheinfo "$mode" "$hash" "$file"
  git cat-file -p "$hash" > "$file"
  rm "$tmp_file"
}

format_go() {
  readarray -t FILES < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.go$')
  for file in "${FILES[@]}"; do
    format_file "$file" gofmt
  done
}

format_json() {
  readarray -t FILES < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.json$')
  for file in "${FILES[@]}"; do
    format_file "$file" jq
  done
}

format_xml() {
  local tidy_path
  tidy_path=$(command -v tidy)
  if [ -z "$tidy_path" ]; then
    echo "Error: tidy command not found"
    exit 1
  fi

  readarray -t FILES < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.xml$')
  for file in "${FILES[@]}"; do
    format_file "$file" "$tidy_path"
  done
}

formatandcheck() {
  file="$1"
  git show ":$file" > "${file}.tmp"
  shellcheck --check-sourced --color --shell=bash -- "${file}.tmp" || return 1
  shfmt -i 2 -bn -ci -sr -w -- "${file}.tmp"
  hash=$(git hash-object -w "${file}.tmp")
  mode="$(get_mode "${file}")"
  git update-index --add --cacheinfo "${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"
  rm "${file}.tmp"
  return $?
}
