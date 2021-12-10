Dotfiles
========

My config files to use in different environments

To install the configs you must have `stow` installed

In arch `pacman -S stow`
In mac `brew install stow`

```bash
stow <folder>

# for example
stow neovim
```

## Fast setup

```bash 
make install stow
```

## Manjaro setup

```
pamac install stow lsd manjaro-zsh-config ripgrep fzf
pamac build neovim-nightly-bin antigen starship-bin pyenv pyenv-virtualenv
```

## Mac setup

[Homebrew](https://brew.sh/) is required:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install everything we need:

```bash
brew install zsh neofetch antigen starship pyenv pyenv-virtualenv lsd rg fzf git-number stow

brew tap jason0x43/homebrew-neovim-nightly
brew install neovim-nightly
```
