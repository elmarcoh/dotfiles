## Shell confs

SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history
setopt appendhistory

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
# bindkey '^[[1;5D' backward-word                                 #
# bindkey '^[[1;5C' forward-word                                  #
# bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
# bindkey '^[[Z' undo                                             # Shift+tab undo last action

# complete partially written commands
# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward
bindkey '^R' history-incremental-search-backward

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# antigen plugin manager
# https://github.com/zsh-users/antigen
#
2>/dev/null source /usr/share/zsh/share/antigen.zsh || source /usr/local/share/antigen/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen apply


## User confs

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

eval "$(starship init zsh)"

eval "$(pyenv init - zsh)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
