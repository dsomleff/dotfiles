# Git aliases
alias ga = git add
alias gs = git status
alias gc = git commit -m
alias gp = git push origin
alias gli = git branch -a
alias glc = git branch -v  # last commit on each branch
alias gf = git fetch --prune
alias lg = lazygit

# Editor
alias v = nvim

# Tmux aliases
alias tm = tmux
alias tma = tmux attach
alias tmas = tmux attach -t
alias tmns = tmux new-session -s
alias tmks = tmux kill-session -t
alias tmka = tmux kill-server

# Tmux sessions
alias conf = tmuxp load ~/dotfiles/.config/tmux/sessions/dotfiles.yaml

# Misc
alias c = clear
alias y = yazi

# Directory navigation
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..
alias ...... = cd ../../../../..

