## Shell confs (a lot of them stolen from manjaro-zsh-config 😅)

SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt autocd
setopt extended_history
setopt share_history
setopt autopushd
setopt histsavenodups

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

bindkey "^Z" push-line  # save current command in stack (for next line)

# antigen plugin manager
# https://github.com/zsh-users/antigen
2>/dev/null source /usr/local/share/antigen/antigen.zsh || \
2>/dev/null source /usr/share/zsh/share/antigen.zsh

  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle metaory/zsh-roundy-prompt

antigen apply

# Antigen likes the roundy colors to come afterwards
typeset -gA RT=(
  bg_ok 4    fg_ok 0    icon_ok ""
  bg_err 1   fg_err 0   icon_err " "
  bg_dir 7   fg_dir 8  icon_time "󰑓 "
  bg_usr 4   fg_usr 0
  bg_git 13  fg_git 8
  bg_time 3  fg_time 8
)

## User confs

# show stuff in new terminals except when recording terminal
if [[ $ASCIINEMA_REC != "1" ]]
then
  which fastfetch > /dev/null && fastfetch -c /usr/share/fastfetch/presets/examples/8.jsonc
fi

if type pyenv > /dev/null; then
  eval "$(pyenv init - zsh)"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi
# eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
