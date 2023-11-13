uname := $(shell uname)
ifeq ($(uname), Linux)
INOS = linux
else ifeq ($(uname), Darwin)
INOS = mac
endif

targets = \
git \
linux-chrome \
nvim \
tmux \
zsh \
neofetch \
guillotine

.PHONY: $(targets)

stow: $(targets)

$(targets):
	stow $@ -t $$HOME

install: install-$(INOS)

install-mac:
	brew install zsh neofetch antigen starship pyenv pyenv-virtualenv lsd rg fzf git-number stow &&\
	brew tap jason0x43/homebrew-neovim-nightly &&\
	brew install neovim-nightly

install-linux:
	sudo pacman -S stow lsd ripgrep fzf && \
	yay -S neovim-nightly-bin antigen starship-bin pyenv pyenv-virtualenv
