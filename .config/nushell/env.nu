#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# Also see `help config env` for more options.
#
use std "path add"
use ./fnm.nu

path add /opt/homebrew/bin


$env.config.edit_mode = 'vi'
# try {
#     load-env (open ($nu.default-config-dir | path join ".secrets.json"))
# }
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

fnm env --json | from json | load-env
# $env.PATH = ($env.PATH | append $"($env.FNM_MULTISHELL_PATH)/bin")
$env.PATH = ($env.PATH
  | prepend $"($env.FNM_MULTISHELL_PATH)/bin"
  | append '/Users/somleff/.rd/bin')
