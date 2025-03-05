#!/usr/bin/env bash
getmode() {
  mode="100644"
  if [ -x "${1}" ]; then
    mode="100755"
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
      tmp=$(mktemp)
      gofmt "${file}.tmp" > "$tmp" && mv "$tmp" "${file}.tmp"
      ret=$((ret + $?))
      # Create a blob object from the formatted file
      hash=$(git hash-object -w "${file}.tmp")
      # Add it back to index
      mode="$(getmode "${file}")"
      git update-index --add --cacheinfo "100${mode}" "$hash" "$file"
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

  cmd="git diff --cached --name-only --diff-filter=ACMR | grep $exts"
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
      tmp=$(mktemp)
      jq -e -S . "${file}.tmp" > "$tmp" && mv "$tmp" "${file}.tmp"
      ret=$((ret + $?))
      # Create a blob object from the formatted file
      hash=$(git hash-object -w "${file}.tmp")
      # Add it back to index
      mode="$(getmode "${file}")"
      git update-index --add --cacheinfo "100${mode}" "$hash" "$file"
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

  cmd="git diff --cached --name-only --diff-filter=ACMR | grep $exts"
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
      git update-index --add --cacheinfo "100${mode}" "$hash" "$file"
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
  shfmt -i 2 -bn -ci -sr -w -- "${file}.tmp"
  # Create a blob object from the formatted file
  hash=$(git hash-object -w "${file}.tmp")
  # Add it back to index
  mode="$(getmode "${file}")"
  git update-index --add --cacheinfo "100${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"
  rm "${file}.tmp"
  shellcheck --check-sourced --color --shell=bash -- "$file"
  return $?
}
