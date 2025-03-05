#!/usr/bin/env bash
######################################################################
# @author      : Linus Fernandes (linusfernandes at gmail dot com)
# @file        : checkfiletypes.sh
# @created     : Tuesday Mar 5, 2025 8:48:10 IST
# @description : Checks for file types functions
######################################################################

iscargolock() {
  FILE="$(basename "${1}")"
  if [ "${FILE}" = "Cargo.lock" ]; then
    return 0
  fi
  return 1
}

isjavafile() {
  FILE="$1"
  if [ "${FILE##*.}" = "java" ]; then
    return 0
  fi
  return 1
}

isgofile() {
  FILE="$1"
  if [ "${FILE##*.}" = "go" ]; then
    return 0
  fi
  return 1
}

ishtmlfileextension() {
  FILE="$1"
  if [ "${FILE##*.}" = "html" ] || [ "${FILE##*.}" = "xhtml" ]; then
    return 0
  fi
  return 1
}

isxmlfileextension() {
  FILE="$1"
  if [ "${FILE##*.}" = "xml" ]; then
    return 0
  fi
  return 1
}

issgmlfileextension() {
  FILE="$1"
  if [ "${FILE##*.}" = "sgml" ]; then
    return 0
  fi
  return 1
}

istextfile() {
  if (file "$1" | grep 'ASCII' &> /dev/null); then
    return 0
  fi
  return 1
}

isshellscript() {
  if (file "$1" | grep 'shell script' &> /dev/null); then
    return 0
  fi
  return 1
}

isxmlfile() {
  if (file "$1" | grep 'XML' &> /dev/null) && (isxmlfileextension "${1}"); then
    return 0
  elif (file "$1" | grep 'HTML' &> /dev/null) && (ishtmlfileextension "${1}"); then
    return 0
  elif (file "$1" | grep 'SGML' &> /dev/null) && (issgmlfileextension "${1}"); then
    return 0
  else
    return 1
  fi
}
