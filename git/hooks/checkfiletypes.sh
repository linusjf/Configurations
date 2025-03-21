#!/usr/bin/env bash
######################################################################
# @author      : Linus Fernandes (linusfernandes at gmail dot com)
# @file        : checkfiletypes.sh
# @created     : Tuesday Mar 5, 2025 8:48:10 IST
# @description : Checks for file types functions
######################################################################

# Checks if the given file is a Cargo.lock file (used in Rust projects)
iscargolock() {
  local file
  file="$(basename "${1}")"
  [[ "${file}" == "Cargo.lock" ]]
}

# Checks if the given file has a .java extension
isjavafile() {
  [[ "$1" == *.* && "${1##*.}" == "java" ]]
}

# Checks if the given file has a .go extension (for Go files)
isgofile() {
  [[ "$1" == *.* && "${1##*.}" == "go" ]]
}

# Checks if the given file has a .md extension (for Markdown files)
ismarkdownfile() {
  if istextfile "$1"; then
    [[ "$1" == *.* && "${1##*.}" == "md" ]]
  else
    return 1
  fi
}

# Checks if the given file has an HTML or XHTML extension
ishtmlfileextension() {
  if [[ "$1" == *.* ]]; then
    [[ "${1##*.}" == "html" ]] || [[ "${1##*.}" == "xhtml" ]]
  else
    return 1
  fi
}

# Checks if the given file has an XML extension
isxmlfileextension() {
  [[ "$1" == *.* && "${1##*.}" == "xml" ]]
}

# Checks if the given file has an SGML extension
issgmlfileextension() {
  [[ "$1" == *.* && "${1##*.}" == "sgml" ]]
}

# Checks if the given file is a text file by looking for 'ASCII' in its type
istextfile() {
  file -b --mime-type "$1" | grep -q 'text/'
}

# Checks if the given file is a shell script by looking for 'shell script' in its type
isshellscript() {
  file -b "$1" | grep -q 'shell script'
}

# Checks if the given file is an XML, HTML, or SGML file
isxmlfile() {
  local filetype
  filetype=$(file -b "$1")
  case "$filetype" in
    *XML*) isxmlfileextension "$1" ;;
    *HTML*) ishtmlfileextension "$1" ;;
    *SGML*) issgmlfileextension "$1" ;;
    *) return 1 ;;
  esac
}
