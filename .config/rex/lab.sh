#!/bin/sh
# Open the studio Rex sessions. Each session: window 1 = nvim, window 2 = dev command.
# Skips a session that already exists, so it is safe to re-run.
#
# Window 2 runs through `zsh -ic` so ~/.zshrc loads (fnm puts node/npm on PATH there).
# --keep-open leaves the output visible if the command stops.

export PATH="$HOME/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH"

CODE="$HOME/Code"

# session <label> <dir> <window-2 command string>
session() {
    label=$1
    dir=$2
    cmd=$3
    rex session inspect "$label" >/dev/null 2>&1 && return 0
    rex new "$label" --cwd "$dir" -- nvim .
    rex run -s "$label" --cwd "$dir" --label dev --focus=false --keep-open --shell none -- zsh -ic "$cmd"
}

session studio-ai-lab "$CODE/studio-ai-lab" "./scripts/run.sh"
session studio-ai-lab-frontend "$CODE/studio-ai-lab-frontend" "npm run dev"
session studio-companion-frontend "$CODE/studio-companion-frontend" "npm run dev"

open -a "Rex Beta"
