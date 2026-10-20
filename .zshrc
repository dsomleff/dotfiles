# PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# npm global binaries
export PATH="$(npm config get prefix)/bin:$PATH"

 # history
HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

# options
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt no_beep
setopt inc_append_history

# fzf overrides
export FZF_DEFAULT_OPTS='
    --layout=reverse
    --color=fg:#a0a0a0,hl:#d9ba73
    --color=fg+:#ffffff,bg+:#272727,hl+:#d9ba73
    --color=border:#272727,header:#8ebeec,gutter:#101010
    --color=spinner:#d9ba73,info:#5abfb5
    --color=pointer:#f2a4db,marker:#ff5733,prompt:#8ebeec
'

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh plugin manager
source /opt/homebrew/opt/zinit/zinit.zsh

# autosuggestions (history hints)
zinit light zsh-users/zsh-autosuggestions

# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# completion system (required by carapace)
autoload -Uz compinit && compinit

# carapace completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace zsh)

# Aliases
alias v="nvim"
alias tm="tmux"
alias tma="tmux attach"
alias tmas="tmux attach -t"
alias tmns="tmux new-session -s"
alias tmks="tmux kill-session -t"
alias tmka="tmux kill-server"

alias c="clear"

alias ls="ls -C -t -U -A -p --color=auto"
alias ls="eza"
alias ll="eza -T --level=1"
alias ll2="eza -T --level=2"
alias ll3="eza -T --level=3"
alias la="eza -Ta --level=1"
alias la2="eza -Ta --level=2"
alias la3="eza -Ta --level=3"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
unalias cdd 2>/dev/null

cdd() {
  local dir
  dir=$(find ~/Code ~/Pets -mindepth 1 -maxdepth 4 -type d | fzf) || return
  cd "$dir"
}

ffp() {
    local files
    files=$(fzf -m --preview="cat {}") || return
    [[ -n $files ]] && nvim ${(f)files}
}
alias ff="fzf"
alias ql="qlmanage -p" # preview file
alias grep='grep --color=auto'

# 3d party tools
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
