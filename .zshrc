# --------------------------------------------
# 🔍 Navigate to a directory interactively using fzf
# 📂 Example: fcd Code
# --------------------------------------------
fcd() {
    local dir
    dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

export DISABLE_AUTO_TITLE='true'

# ==================================================
# 🧠 Source zsh-autosuggestions
# 🎯 Source zsh-syntax-highlighting (should be sourced last)
# ==================================================
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# 🖥️ Aliases
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push origin"
alias gli="git branch -a"
alias glc="git branch -v" #last commit on each branch
alias gf="git fetch --prune"

alias v="nvim"

alias tm="tmux"
alias tma="tmux attach"
alias tmas="tmux attach -t"
alias tmns="tmux new-session -s"
alias tmks="tmux kill-session -t"
alias tmka="tmux kill-server"

alias ff="fzf"
alias ffp='v $(ff -m --preview="cat {}")'
alias c="clear"

alias ls="eza --icons"
alias ll="eza -lg --icons"
alias la="eza -lag --icons"

# Tmux sessions
alias conf="tmuxp load ~/dotfiles/.config/tmux/sessions/dotfiles.yaml"

# Use Neovim as "preferred editor"
export VISUAL=nvim

# for tmux color consistency
export TERM=tmux-256color

# Function to count the number of lines in files with a given extension
lines_number() {
  if [ -z "$1" ]; then
    echo "Usage: lines_number <file_extension>"
    return 1
  fi

  find . -name "*.$1" | xargs -I {} cat {} | wc -l
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

PATH=/opt/podman/bin:$PATH

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/somleff/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

### zoxide init
eval "$(zoxide init --cmd cd zsh)"

# Starship prompt initialization
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# prime tmux-sessionizer
PATH="$PATH":"$HOME/.local/scripts/"

bindkey -s ^f "tmux-sessionizer\n"
