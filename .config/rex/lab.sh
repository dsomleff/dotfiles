#!/bin/sh
# Open the studio Rex sessions. Each session: window 1 = nvim, window 2 = dev command.
# Skips a session that already exists, so it is safe to re-run.
# FRESH=1 kills an existing session first and recreates it (use after a reboot)

export PATH="$HOME/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH"

CODE="$HOME/Code"
NU=/opt/homebrew/bin/nu

session() {
    label=$1
    dir=$2
    cmd=$3
    shell=${4:-$NU}
    if rex session inspect "$label" >/dev/null 2>&1; then
        [ "${FRESH:-1}" = 1 ] || return 0
        rex kill "$label"
    fi
    rex new "$label" --cwd "$dir" -- "$NU"
    rex send -s "$label" 'nvim .'
    rex send-key -s "$label" enter
    block=$(rex run -s "$label" -c "$dir" --focus=false --json -- "$shell" | jq -r '.block_ids[0]')
    rex send -s "$label" -b "$block" "$cmd"
    rex send-key -s "$label" -b "$block" enter
}

session studio-ai-lab "$CODE/studio-ai-lab" "./scripts/run.sh" /bin/zsh
session studio-ai-lab-frontend "$CODE/studio-ai-lab-frontend" "npm run dev"
session studio-companion-frontend "$CODE/studio-companion-frontend" "npm run dev"

open -a "Rex Beta"
