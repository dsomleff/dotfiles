# Nushell

## Create a link to the nushell config

```bash
# Start Nushell without using history so it won't interact with the data folder during our operations
# To avoid problems, do not launch or use another instance of Nushell during this session
> nu --no-history

# See that the current path contains space and might cause inconvenience and even problems
> $nu.default-config-dir

# Create a symlink from the new config location to the default location
> ln -s ~/dotfiles/.config/nushell $nu.default-config-dir

# Add the XDG_CONFIG_HOME variable to your .zshrc file
> (char nl) + 'export XDG_CONFIG_HOME="$HOME/dotfiles/.config"' + (char nl) | save --append ~/.zshrc
```

## Make nu default shell

- Run `$nu.config-path`
- Copy path without `config.nu` at the end and run it with `cd your path`
- Create 2 files: `config.nu` and `env.nu`
- Put `source ~/dotfiles/.config/nushell/config.nu` into `config.nu`
- Put `$env.XDG_CONFIG_HOME = $"($env.HOME)/dotfiles/.config"`
