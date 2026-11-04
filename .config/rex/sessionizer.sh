#!/bin/zsh
set -eu

export PATH="$HOME/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH"

selected=$(fd . --type d --mindepth 1 --maxdepth 1 --search-path ~/Code --search-path ~/Pets --absolute-path |
	sed "s|^$HOME|~|" | sort | fzf) || exit 0
dir="$HOME${selected#\~}"
label=$(basename "$dir" | tr . _)

session=$(rex ls --json | jq -r --arg label "$label" '[.sessions[]? | select(.label == $label)][0].session_id // empty')
if [ -z "$session" ]; then
	session=$(rex new "$label" -c "$dir" --json | jq -r '.session_id')
fi

rex do session.select session_id="$session"
