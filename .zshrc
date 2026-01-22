# load modules
# zmodload zsh/complist
# autoload -U compinit && compinit
# autoload -U colors && colors

# completion opts
# zstyle ':completion:*' menu select # tab opens cmp menu
# zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main options
setopt auto_menu menu_complete
setopt autocd
setopt auto_param_slash
setopt globdots

# History file location (XDG-compliant)
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_history"

# Increase history size
HISTSIZE=1000000         # in-memory history
SAVEHIST=1000000         # on-disk history

# History behavior
setopt appendhistory           # don't overwrite history file, append to it
setopt sharehistory            # share history across terminals
setopt hist_ignore_space       # ignore commands starting with space
setopt hist_ignore_dups        # ignore duplicate commands
setopt hist_ignore_all_dups    # remove older duplicate commands
setopt hist_save_no_dups       # don't save duplicates to history
setopt hist_find_no_dups       # when searching, skip duplicates
setopt inc_append_history      # write to history file immediately

# Aliases
alias v="nvim"
alias tm="tmux"
alias tma="tmux attach"
alias tmas="tmux attach -t"
alias tmns="tmux new-session -s"
alias tmks="tmux kill-session -t"
alias tmka="tmux kill-server"
alias conf="tmuxp load ~/dotfiles/.config/tmux/sessions/dotfiles.yaml"

alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push origin"
alias gli="git branch -a"
alias glc="git branch -v" #last commit on each branch
alias gf="git fetch --prune"
alias lg="lazygit"

alias c="clear"

alias ls="ls -C -t -U -A -p --color=auto"
# alias ls="eza --icons"
# alias ll="eza -lTh --level=1 --icons"
# alias ll2="eza -lTh --level=2 --icons"
# alias ll3="eza -lTh --level=3 --icons"
# alias la="eza -lTah --level=1 --icons"
# alias la2="eza -lTah --level=2 --icons"
# alias la3="eza -lTah --level=3 --icons"

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

# alias ff="fzf"
# alias ffp='v $(ff -m --preview="cat {}")'
# alias cat="bat --theme=Nord"
alias ql="qlmanage -p"
alias grep='grep --color=auto'

# Use Neovim as "preferred editor"
export EDITOR="nvim"
export VISUAL="$EDITOR"

# for tmux color consistency
export TERM=tmux-256color

# syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### zoxide init
# eval "$(zoxide init --cmd cd zsh)"

# Starship prompt initialization
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

export XDG_CONFIG_HOME="$HOME/dotfiles/.config"

# Initialize fnm (Fast Node Manager)
# autoload -U add-zsh-hook
#
# fnm_auto_use() {
#   [[ -f .node-version || -f .nvmrc ]] || return
#   fnm use --silent-if-unchanged
# }
#
# add-zsh-hook chpwd fnm_auto_use

export PYENV_ROOT="$HOME/.pyenv"
typeset -U path

path=(
  # prime tmux-sessionizer
  $HOME/.local/scripts

  ### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT) Remove after stop/not using Rancher
  /Users/somleff/.rd/bin
  ### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

  # Homebrew
  /opt/homebrew/bin

  # pyenv binaries
  $PYENV_ROOT/bin

  # keep existing PATH entries
  $path
)

[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

. "$HOME/.local/bin/env"
# autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
