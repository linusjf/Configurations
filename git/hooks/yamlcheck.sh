#!/usr/bin/env bash
requirefns isyamlfile

checkyamls() {
  # Regexp for grep to only choose md file extension for checking
  local exts="\.ya?ml$"
  local ret=0

  local -a files=()
  mapfile -t files < <(git diff --cached --name-only --diff-filter=ACMR | grep -E "$exts" || true)

  for file in "${files[@]}"; do
    if [[ -n "$file" && -f "$file" ]] && isyamlfile "$file"; then
      formatandcheckyaml "$file"
      ret=$((ret + $?))
    fi
  done

  return "$ret"
}

formatandcheckyaml() {
  local file="$1"
  local tmpfile
  tmpfile="$(mktemp -t "$(basename "${file}").XXXXXX")"
  git show ":$file" > "$tmpfile"
  yamllint "$tmpfile" || return 1
  yamlfmt "$tmpfile" || return 1
  local hash
  hash=$(git hash-object -w "$tmpfile")
  local mode
  mode="$(get_mode "${file}")"
  git update-index --add --cacheinfo "${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"
  rm "$tmpfile"
  return $?
}
