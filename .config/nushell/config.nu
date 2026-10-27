#
# See `help config nu` for more options
#
source ~/dotfiles/.config/nushell/env.nu

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
$env.STARSHIP_CONFIG = '/Users/somleff/dotfiles/.config/starship/starship.toml'

# Git aliases
alias lg = lazygit

# Editor
alias v = nvim

def --wrapped bob [...args] {
    let secret_file = ("~/.secrets.env" | path expand)
    let key = if ($secret_file | path exists) {
        open $secret_file | lines | parse "{key}={val}" | where key == "BOBSHELL_API_KEY" | get -o 0.val | default "" | str trim -c '"'
    } else {
        ""
    }

    with-env { BOBSHELL_API_KEY: $key } {
        ^bob chat --mode ask ...$args
    }
}

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
alias ts = bash /Users/somleff/dotfiles/.local/scripts/tmux-sessionizer

# Shell
alias c = clear
alias rm = rm -v -i
alias mv = mv -v -i
alias cp = cp -v -i
alias cdd = cd (fd . --type d --mindepth 1 --maxdepth 4 --search-path ~/Code --search-path ~/Pets --absolute-path | fzf)
alias ls = ls -a

$env.PATH = ($env.PATH | append "~/dotfiles/.config/scripts")
