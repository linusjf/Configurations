#!/usr/bin/env bash
getmode() {
  mode="644"
  if [ -x "${1}" ]; then
    mode="755"
  fi
  printf "%s" "${mode}"
}

formatgo() {
  local ret=0
  # Regexp for grep to only choose some file extensions for formatting
  exts="\.go$"

  cmd="git diff --cached --name-only --diff-filter=ACMR | grep -E '${exts}' || true"

  readarray -t FILES < <(eval "$cmd")
  ret=$((ret + $?))

  # Format staged files
  for file in "${FILES[@]}"; do
    # don't format empty files
    if test -s "$file"; then
      echo "Formatting ${file}..."
      # Get the file from index
      git show ":$file" > "${file}.tmp"
      # Format it
      tmpfile=$(mktemp)
      gofmt "${file}.tmp" > "$tmpfile" && mv "$tmpfile" "${file}.tmp"
      ret=$((ret + $?))
      # Create a blob object from the formatted file
      hash=$(git hash-object -w "${file}.tmp")
      # Add it back to index
      mode="$(getmode "${file}")"
      git update-index --add --cacheinfo "${mode}" "$hash" "$file"
      git cat-file -p "$hash" > "${file}"
      rm "${file}.tmp"
    fi
  done
  return "$ret"
}

formatjson() {
  local ret=0
  # Regexp for grep to only choose some file extensions for formatting
  exts="\.json$"

  cmd="git diff --cached --name-only --diff-filter=ACMR | grep -E '${exts}' || true"
  readarray -t FILES < <(eval "$cmd")
  ret=$((ret + $?))

  # Format staged files
  for file in "${FILES[@]}"; do
    # don't format empty files
    if test -s "$file"; then
      echo "Formatting ${file}..."
      # Get the file from index
      git show ":$file" > "${file}.tmp"
      # Format it
      tmpfile=$(mktemp)
      jq -e -S . "${file}.tmp" > "$tmpfile" && mv "$tmpfile" "${file}.tmp"
      ret=$((ret + $?))
      # Create a blob object from the formatted file
      hash=$(git hash-object -w "${file}.tmp")
      # Add it back to index
      mode="$(getmode "${file}")"
      git update-index --add --cacheinfo "${mode}" "$hash" "$file"
      git cat-file -p "$hash" > "${file}"
      rm "${file}.tmp"
    fi
  done
  return "$ret"
}

formatxml() {
  local ret=0
  declare -r configFileName="tidy.config"
  configFilePath="$(readlink -f "$configFileName")"
  # Regexp for grep to only choose some file extensions for formatting
  exts="\.xml$"

  # The formatter to use
  formatter=$(which tidy)

  # Check availability of the formatter
  if [ -z "$formatter" ]; then
    echo 1>&2 "$formatter not found. Pre-commit formatting will not be done."
    exit 0
  fi

  cmd="git diff --cached --name-only --diff-filter=ACMR | grep -E '${exts}' || true"
  readarray -t FILES < <(eval "$cmd")
  ret=$((ret + $?))

  # Format staged files
  for file in "${FILES[@]}"; do
    # don't format empty files
    if test -s "$file"; then
      echo "Formatting ${file}..."
      # Get the file from index
      git show ":$file" > "${file}.tmp"
      # Format it
      eval "$formatter -config $configFilePath -quiet -xml -m -i ${file}.tmp"
      ret=$((ret + $?))
      # Create a blob object from the formatted file
      hash=$(git hash-object -w "${file}.tmp")
      # Add it back to index
      mode="$(getmode "${file}")"
      git update-index --add --cacheinfo "${mode}" "$hash" "$file"
      git cat-file -p "$hash" > "${file}"
      rm "${file}.tmp"
    fi
  done
  return "$ret"
}

formatandcheck() {
  file="$1"
  # Get the file from index
  git show ":$file" > "${file}.tmp"
  shellcheck --check-sourced --color --shell=bash -- "$file.tmp" || return 1
  shfmt -i 2 -bn -ci -sr -w -- "${file}.tmp"
  # Create a blob object from the formatted file
  hash=$(git hash-object -w "${file}.tmp")
  # Add it back to index
  mode="$(getmode "${file}")"
  git update-index --add --cacheinfo "${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"
  rm "${file}.tmp"

  return $?
}
