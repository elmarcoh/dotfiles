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

## Manjaro setup

```
pamac install stow lsd manjaro-zsh-conifg ripgrep fzf
pamac build neovim-nightly-bin antigen starship-bin pyenv pyenv-virtualenv
```

## Mac setup

`brew` is required

```bash
brew install zsh neofetch antigen starship pyenv pyenv-virtualenv lsd rg fzf
```
