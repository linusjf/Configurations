#!/usr/bin/env bash

######################################################################
# @author      : Linus Fernandes (linusfernandes at gmail dot com)
# @file        : internet.sh
# @created     : Tuesday Mar 26, 2024 11:57:10 IST
#
# @description :
######################################################################
checkinternet() {
  hash ping | exit
  ping -q -w 1 -c 1 8.8.8.8 &> /dev/null
  if test $? -eq 0; then
    return 0
  else
    echo "Check your internet connection..."
    return 1
  fi
}
if ! checkinternet; then
  exit 1
fi
