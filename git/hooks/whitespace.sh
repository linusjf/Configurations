#!/usr/bin/env bash
requirefns() {
  for fn in "$@"; do
    if [[ "$(type -t "$fn")" != "function" ]]; then
      echo "$fn function does not exist."
      exit 1
    fi
  done
}

requirefns istextfile isxmlfile

checkws() {
  local ret=0
  local tmp wsout
  # Get list of staged files
  readarray -t FILES < <(git diff --cached --name-only)
  for file in "${FILES[@]}"; do
    if istextfile "$file"; then
      wsout=0
      echo "Checking ${file} for whitespace..."
      tmp="$(mktemp)"
      case "$file" in
        *.xml | *.sgml | *.html | *.xhtml)
          # check file content and not empty or something else
          if isxmlfile "$file"; then
            striptabsandlines "$file" 0
            wscheck --color --exclude WSC002 WSC003 --checkstyle "$tmp" -- "$file"
          fi
          ;;
        *.go)
          striptabsandlines "$file" 0
          wscheck --color --exclude WSC004 --checkstyle "$tmp" -- "$file"
          ;;
        *.java | *Cargo.lock)
          wscheck --color --exclude WSC003 --checkstyle "$tmp" -- "$file"
          ;;
        *)
          striptabsandlines "$file"
          wscheck --color --exclude WSC003 --checkstyle "$tmp" -- "$file"
          ;;
      esac
      wsout=$?
      ((ret += wsout))
      if [[ "$wsout" -ne 0 ]]; then
        mv "$tmp" "${file}.wsout"
      else
        rm "$tmp"
      fi
    fi
  done
  return "$ret"
}

stripnewlines() {
  # convert contents of file to here string
  # using the <<< input operator which strips
  # out any trailing new lines
  # which is then piped to sponge rewriting
  # the buffered output
  cat <<< "$(cat "${1}")" | sponge "${1}"
  # strip out trailing white spaces on every line
  sed -i 's/[[:blank:]]*$//' "${1}"
}

striptabsandlines() {
  local file="$1"
  local is_xml_file="${2:-1}"
  local tmp_file

  # Create a temporary file
  tmp_file="$(mktemp)"
  # Get the file from index
  git cat-file -p ":$file" > "$tmp_file"

  # strip tabs and new lines
  if test "$is_xml_file" -ne 0; then
    expand -i -t 2 "$tmp_file" | sponge "$tmp_file"
  fi
  stripnewlines "$tmp_file"
  # Create a new git blob object from the formatted file
  local hash
  hash=$(git hash-object -w "$tmp_file")
  # Add it back to index
  local mode
  mode=$(stat -c "%a" "$file")
  git update-index --add --cacheinfo "100${mode}" "$hash" "$file"
  git cat-file -p "$hash" > "${file}"

  # Clean-up
  rm "$tmp_file"
  return $?
}
