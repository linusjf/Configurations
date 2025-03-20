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
  shift 2
  local tmp_file
  tmp_file="$(mktemp)"

  git show ":$file" > "$tmp_file"
  "$formatter" "$@" "$tmp_file"
  local hash
  hash=$(git hash-object -w "$tmp_file")
  local mode
  mode=$(get_mode "$file")
  git update-index --add --cacheinfo "$mode" "$hash" "$file"
  git cat-file -p "$hash" > "$file"
  rm "$tmp_file"
}

format_go() {
  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.go$')
  for file in "${files[@]}"; do
    format_file "$file" gofmt
  done
}

format_json() {
  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.json$')
  for file in "${files[@]}"; do
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

  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.xml$')
  for file in "${files[@]}"; do
    format_file "$file" "$tidy_path"
  done
}

formatandcheck() {
  local file="$1"
  local tmpfile
  tmpfile="$(mktemp -t "$(basename "${file}").XXXXXX")"
  git show ":$file" > "$tmpfile"
  shellcheck --check-sourced --color --shell=bash -- "$tmpfile" || return 1
  shfmt -i 2 -bn -ci -sr -w -- "$tmpfile"
  local hash
  hash=$(git hash-object -w "$tmpfile")
  local mode
  mode="$(get_mode "${file}")"
  git update-index --add --cacheinfo "${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"
  rm "$tmpfile"
  return $?
}
