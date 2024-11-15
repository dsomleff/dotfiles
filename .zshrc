#  Navigate to a directory interactively using fzf
#  Example: fcd Code
fcd() {
    local dir
    dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf)
    if [ -n "$dir" ]; then
        cd "$dir"
    fi
}

export DISABLE_AUTO_TITLE='true'

#  Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load completions
autoload -Uz compinit && compinit

#  Aliases
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
alias ll="eza -lT --icons"
alias la="eza -lTa --level=1 --icons"
alias lat2="eza -lTa --level=2 --icons"
alias lat3="eza -lTa --level=3 --icons"
alias lata="eza -lTa --icons"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

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


#  NVM is set up correctly
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

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

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -s ^f "tmux-sessionizer\n"
