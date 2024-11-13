# Upgrade brew
brew upgrade

# Install CLI tools
# brew install zsh
brew install fzf
brew install zoxide
# brew install git
brew install neovim
brew install tmux
brew install tmuxp
brew install stow
brew install alacritty
brew install wget
brew install tree
brew install eza
brew install bat

# Install dev tools
brew install --cask docker
brew install insomnia
brew install raycast
brew install --cask arc

brew install node@18
brew link --force --overwrite node@18

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

brew install --cask webstorm
brew install --cask rancher
brew install --cask notion

# Other tools
brew install --cask rectangle
brew install --cask telegram

# Remove outdated versions from the cellar.
brew cleanup
