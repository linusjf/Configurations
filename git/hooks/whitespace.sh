#!/usr/bin/env bash
requirefns() {
  for fn in "$@"; do
    if [[ "$(type -t "$fn")" != "function" ]]; then
      echo "$fn function does not exist."
      exit 1
    fi
  done
}

requirefns istextfile isxmlfile isgofile isjavafile iscargolock

checkws() {
  local ret=0
  # If no files left in index after formatting - fail
  # i.e., if files are similar after changes
  cmd="git diff --cached --name-only"
  readarray -t FILES < <(eval "$cmd")
  for file in "${FILES[@]}"; do
    if istextfile "$file"; then
      declare -i wsout=0
      echo "Checking ${file} for whitespace..."
      tmp="$(mktemp)"
      if isxmlfile "$file"; then
        striptabsandlines "$file" 0
        wscheck --color --exclude WSC002 WSC003 --checkstyle "$tmp" -- "$file"
        wsout=$?
      elif isgofile "$file"; then
        striptabsandlines "$file" 0
        wscheck --color --exclude WSC004 --checkstyle "$tmp" -- "$file"
        wsout=$?
      elif isjavafile "$file"; then
        wscheck --color --exclude WSC003 --checkstyle "$tmp" -- "$file"
        wsout=$?
      elif iscargolock "$file"; then
        wscheck --color --exclude WSC003 --checkstyle "$tmp" -- "$file"
        wsout=$?
      else
        striptabsandlines "$file"
        wscheck --color --exclude WSC003 --checkstyle "$tmp" -- "$file"
        wsout=$?
      fi
      ret=$((ret + wsout))
      if test "$wsout" -ne 0; then
        mv "$tmp" "${file}.wsout"
      else
        rm "$tmp"
      fi
    fi
  done
  return "$ret"
}

stripnewlines() {
  awk 'NF {p=1} p' <<< "$(< "${1}")" | sponge "$1"
  sed -i 's/[[:blank:]]*$//' "${1}"
}

striptabsandlines() {
  file="$1"
  isxml="${2:-1}"
  # Get the file from index
  git show ":$file" > "${file}.tmp"
  if test "$isxml" -ne 0; then
    expand -i -t 2 "${file}.tmp" | sponge "${file}.tmp"
  fi
  stripnewlines "${file}.tmp"
  # Create a blob object from the formatted file
  hash=$(git hash-object -w "${file}.tmp")
  # Add it back to index
  mode=$(stat -c "%a" "$file")
  git update-index --add --cacheinfo "100${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"
  rm "${file}.tmp"
  return $?
}
