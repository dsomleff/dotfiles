#!/usr/bin/env bash

cd "$(tmux display-message -p "#{pane_start_path}")" || exit
url=$(git remote get-url origin 2>/dev/null)

if [[ -z "$url" ]]; then
    echo "Not a git repository or no remote found"
    exit 1
fi

if [[ $url == git@* ]]; then
    url="${url#git@}"
    url="${url/://}"
    url="https://$url"
fi

open "$url"

