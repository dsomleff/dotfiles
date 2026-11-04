#!/bin/sh
# Open Rex session "dotfiles": one tab in ~/dotfiles running nvim.
# `v` is a shell alias, which rex does not expand, so call nvim directly.

export PATH="$HOME/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH"

if ! rex session inspect dotfiles >/dev/null 2>&1; then
    rex new dotfiles --cwd "$HOME/dotfiles" -- nvim .
fi

open -a "Rex Beta"
