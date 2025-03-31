#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# Also see `help config env` for more options.
#
use std "path add"
path add /opt/homebrew/bin

zoxide init nushell | save -f ~/.zoxide.nu

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

fnm env --json | from json | load-env
path add $env.FNM_MULTISHELL_PATH

