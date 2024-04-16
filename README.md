# Stow Dotfiles

All usefull dotfiles  for your system.

## Requirements

Git and Stow and Brew </br>

To install stow use
```sh
brew install  stow
```

Use this video as inspiration &mdash; ["Click"](https://www.youtube.com/watch?v=y6XCebnB9gs) </br>

## Beware
Some file added into `.gitgnore` and some in `stow-local-ignore`. </br>
That's made on purpose to prevent sharing things like plugins into this repo and do not semilink unnesesary things with stow.

## gitignore
After install new machine add the following lines to the `.gitconfig` file:
```bash
[core]
    excludesfile = ~/.gitignore_global
```

This tells Git to use a global ignore file located at `~/.gitignore_global`.

1. Save and exit the text editor.

2. Create or open the global Git ignore file `~/.gitignore_global`:
```bash
nano ~/.gitignore_global
```

Add the following line to the `.gitignore_global` file:
```bash
.DS_Store
```
