#!/usr/bin/env bash
######################################################################
# @author      : Linus Fernandes (linusfernandes at gmail dot com)
# @file        : checkfiletypes.sh
# @created     : Tuesday Mar 5, 2025 8:48:10 IST
# @description : Checks for file types functions
######################################################################

# Checks if the given file is a Cargo.lock file (used in Rust projects)
iscargolock() {
  FILE="$(basename "${1}")"
  [[ "${FILE}" == "Cargo.lock" ]]
}

# Checks if the given file has a .java extension
isjavafile() {
  [[ "${1##*.}" == "java" ]]
}

# Checks if the given file has a .go extension (for Go files)
isgofile() {
  [[ "${1##*.}" == "go" ]]
}

# Checks if the given file has an HTML or XHTML extension
ishtmlfileextension() {
  [[ "${1##*.}" == "html" ]] || [[ "${1##*.}" == "xhtml" ]]
}

# Checks if the given file has an XML extension
isxmlfileextension() {
  [[ "${1##*.}" == "xml" ]]
}

# Checks if the given file has an SGML extension
issgmlfileextension() {
  [[ "${1##*.}" == "sgml" ]]
}

# Checks if the given file is a text file by looking for 'ASCII' in its type
istextfile() {
  file -b "$1" | grep -q 'ASCII'
}

# Checks if the given file is a shell script by looking for 'shell script' in its type
isshellscript() {
  file -b "$1" | grep -q 'shell script'
}

# Checks if the given file is an XML, HTML, or SGML file
isxmlfile() {
  case "$(file "$1")" in
    *XML*) isxmlfileextension "$1" && return 0 ;;
    *HTML*) ishtmlfileextension "$1" && return 0 ;;
    *SGML*) issgmlfileextension "$1" && return 0 ;;
  esac
  return 1
}
