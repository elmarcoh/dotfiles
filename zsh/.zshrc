neofetch
# Use powerline
# USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

if starship -h > /dev/null; then
  eval "$(starship init zsh)"
fi

if 1>/dev/null 2>/dev/null pyenv -h; then
  eval "$(pyenv init - zsh)"
  eval "$(pyenv init --path)"
fi

if 1>/dev/null 2>/dev/null pyenv virtualenv -h; then
  eval "$(pyenv virtualenv-init -)"
fi
