#!/usr/bin/env bash
requirefns isjsonfile

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
  tmp_file="$(mktemp -t "$(basename "${file}").XXXXXX")"

  git show ":$file" > "$tmp_file"
  "$formatter" "$@" "$tmp_file" || {
    printf "%s" "Error formatting ${file}"
    return 1
  }
  local hash
  hash=$(git hash-object -w "$tmp_file")
  local mode
  mode=$(get_mode "$file")
  git update-index --add --cacheinfo "$mode" "$hash" "$file"
  git cat-file -p "$hash" > "$file"
  rm "$tmp_file"
}

format_go() {
  local ret=0
  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.go$')
  for file in "${files[@]}"; do
    format_file "$file" gofmt || ((ret = 1))
  done
  exit "$ret"
}

format_json() {
  local ret=0
  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.json$')
  for file in "${files[@]}"; do
    if isjsonfile "$file"; then
      format_file "$file" json --quiet --output jsony -I -f || ((ret = 1))
    else
      printf "Invalid json file: %s" "$file"
      ((ret = 1))
    fi
  done
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep '^\.*rc$')
  for file in "${files[@]}"; do
    if isjsonfile "$file"; then
      format_file "$file" json --quiet --output jsony -I -f || ((ret = 1))
    fi
  done
  return "$ret"
}

format_xml() {
  local ret=0
  local tidy_path
  tidy_path=$(command -v tidy)
  if [ -z "$tidy_path" ]; then
    echo "Error: tidy command not found"
    exit 1
  fi

  local -a files=()
  readarray -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep '\.xml$')
  for file in "${files[@]}"; do
    format_file "$file" "$tidy_path" || ((ret = 1))
  done
  exit "$ret"
}

formatandcheck() {
  local file="$1"
  local tmpfile
  tmpfile="$(mktemp -t "$(basename "${file}").XXXXXX")"
  git show ":$file" > "$tmpfile"
  if shellcheck --check-sourced --color -- "$tmpfile"; then
    if shfmt -i 2 -bn -ci -sr -w -- "$tmpfile"; then
      local hash=$(git hash-object -w "$tmpfile")
      local mode="$(get_mode "${file}")"
      git update-index --add --cacheinfo "${mode}" "$hash" "$file"
      git cat-file -p "$hash" > "${file}"
      rm "$tmpfile"
      return $?
    else
      return 1
    fi
  else
    return 1
  fi

}

formatandcheckmd() {
  local file="$1"
  local tmpfile
  tmpfile="$(mktemp -t "$(basename "${file}").XXXXXX")"
  git show ":$file" > "$tmpfile"
  markdownlint --fix "$tmpfile" || return 1
  prettier --parser markdown --log-level silent --write "$tmpfile" || return 1
  local hash
  hash=$(git hash-object -w "$tmpfile")
  local mode
  mode="$(get_mode "${file}")"
  git update-index --add --cacheinfo "${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"
  rm "$tmpfile"
  return $?
}
