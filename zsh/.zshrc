## Shell confs (a lot of them stolen from manjaro-zsh-config 😅)

SAVEHIST=1000  # Save most-recent 1000 lines
HISTSIZE=1000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt autocd
setopt extended_history
setopt share_history

zstyle ':completion:*' rehash true  # automatically find new executables in path
zstyle ':completion:*' menu select  # display white bg when cycling completion options

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# bash style ctl + A & E for moving to BOL/EOL
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

bindkey '^H' backward-kill-word  # delete previous word with ctrl+backspace
bindkey '^[[Z' undo # Shift+tab undo last action

bindkey '^R' history-incremental-search-backward

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up key
bindkey "^[[B" down-line-or-beginning-search # Down key

# antigen plugin manager
# https://github.com/zsh-users/antigen
#
2>/dev/null source /usr/share/zsh/share/antigen.zsh || source /usr/local/share/antigen/antigen.zsh

  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply


## User confs

neofetch  # show stuff in new terminals

eval "$(starship init zsh)"
eval "$(pyenv init - zsh)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
