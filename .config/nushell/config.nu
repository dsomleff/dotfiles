#
# See `help config nu` for more options
#
source ~/dotfiles/.config/nushell/env.nu

# zoxide
source ~/.zoxide.nu

# Carapace
source ~/.cache/carapace/init.nu

$env.EDITOR = 'nvim'

$env.config = {
    show_banner: false  # Disable welcome message

    history: {
        max_size: 100_000
        isolation: false
        sync_on_enter: true
    #     file_format: "sqlite"
    }
}

# Starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Git aliases
alias lg = lazygit

# Editor
alias v = nvim

# Tmux aliases
alias tm = tmux
alias tma = tmux attach
alias tmns = tmux new-session -s
alias tmks = tmux kill-session -t
alias tmka = tmux kill-server

# Tmux sessions
alias conf = tmuxp load ~/dotfiles/.config/tmux/sessions/dotfiles.yaml
alias hub = tmuxp load ~/dotfiles/.config/tmux/sessions/hub.yaml
alias hub2 = tmuxp load ~/dotfiles/.config/tmux/sessions/hub2.yaml

# Misc
alias c = clear
alias y = yazi

# Directory navigation
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..

