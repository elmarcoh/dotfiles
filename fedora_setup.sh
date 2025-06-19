#!/bin/sh

# Nerd fonts fallback (instead of patched fonts)
dnf copr list | grep 'che/nerd-fonts' 1> /dev/null || sudo dnf copr enable -y che/nerd-fonts

# Basic packages
sudo dnf install -y \
	stow tmux zsh lsd bat fd ripgrep fzf zoxide fastfetch neovim gh \
	gnome-tweaks gnome-extensions \
	gnome-shell-extension-{appindicator,blur-my-shell} \
	nerd-fonts jetbrains-mono-nl-fonts

[ "$DESKTOP_SESSION" != "" ] && \
	flatpak install com.github.zocker_160.SyncThingy com.logseq.Logseq


[ "$SHELL" != "/bin/zsh" ] && chsh -s /bin/zsh
