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
