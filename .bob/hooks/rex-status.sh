#!/bin/sh
# usage: rex-status.sh <state> <message> [kind]
# Reports Bob status to Rex via OSC 7501 (Program Status Protocol).
# kind (permission|question|auth) is only valid with state=blocked.
msg=$(printf '%s' "$2" | base64 | tr -d '\n')
kind=""
[ -n "$3" ] && kind=":kind=$3"
printf '\033]7501;state=%s%s:app=bob:msg=%s\033\\' "$1" "$kind" "$msg" > /dev/tty 2>/dev/null
exit 0
