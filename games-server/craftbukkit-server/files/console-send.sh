#!/bin/sh

NAME="$1"
SOCKET="/tmp/tmux-craftbukkit-${NAME}"

if [[ ! -S "${SOCKET}" ]] ; then
	NAME="main"
	echo "Server name not specified. Defaulting to \"${NAME}\"." >&2
else
	shift 1
	echo "Using server name \"${NAME}\"." >&2
fi

SOCKET="/tmp/tmux-craftbukkit-${NAME}"

if [[ ! -S "${SOCKET}" ]]; then
	echo "The socket file is missing. Is the server running?" >&2
	exit 1
fi

exec /usr/bin/tmux -S "${SOCKET}" send-keys "$@" C-m
