#!/usr/bin/env bash
if "$DEBUG"; then
	echo "DEBUG mode on."
	set -xve
	PS4='+ ${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}() '
fi
