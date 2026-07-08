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
setopt correct

zstyle ':completion:*' rehash true  # automatically find new executables in path
zstyle ':completion:*' menu select  # display white bg when cycling completion options

## Key Bindings {{{
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

# Edit command on nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
# }}}

# Plugins {{{
# https://github.com/zsh-users/antigen

if [ ! -e ~/.local/share/antigen/antigen.zsh ]; then
	mkdir -p ~/.local/share/antigen
	curl -L git.io/antigen > ~/.local/share/antigen/antigen.zsh
fi

source $HOME/.local/share/antigen/antigen.zsh
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply # }}}

## Minimal Prompt {{{

# Enable variable and command substitution in prompt
setopt PROMPT_SUBST

# Colors (Catppuccin purples + error red)
# Colors (Catppuccin cyan to magenta gradient, desaturated)

# Set PROMPT_COLOR_SCHEME=ansi to use terminal palette colors instead of Catppuccin hex colors.
PROMPT_COLOR_SCHEME="${PROMPT_COLOR_SCHEME:-ansi}"

if [[ "$PROMPT_COLOR_SCHEME" == "ansi" ]]; then
  RESET=$'%{\e[0m%}'
  USER_OK_BG=$'%{\e[45;30m%}'
  USER_ERR_BG=$'%{\e[41;30m%}'
  GIT_BG=$'%{\e[0m\e[36m%}'
  DIR_BG=$'%{\e[106;30m%}'
  CLOCK_FG=$'%{\e[36m%}'
else
  RESET="%f%k"
  CYAN_BG="#5fb3d4"
  TEAL_BG="#7bc4b8"
  MAUVE_BG="#a888d4"
  RED_BG="#d4758a"
  BASE_FG="#1e1e2e"

  USER_OK_BG="%K{$MAUVE_BG}%F{$BASE_FG}"
  USER_ERR_BG="%K{$RED_BG}%F{$BASE_FG}"
  GIT_BG="%K{$TEAL_BG}%F{$BASE_FG}"
  DIR_BG="%K{$CYAN_BG}%F{$BASE_FG}"
  CLOCK_FG="%F{$TEAL_BG}"
fi

# vcs_info for git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
precmd() { vcs_info }

# Conditional username color depending on last command exit code
USERNAME_BG='$(if [[ $? -ne 0 ]]; then echo "$USER_ERR_BG"; else echo "$USER_OK_BG"; fi)'

PROMPT_LOGO="${PROMPT_LOGO:-}"
# The final prompt, double quoted
PROMPT="${USERNAME_BG} ${PROMPT_LOGO} ${RESET}"\
'${vcs_info_msg_0_:+${GIT_BG} ${vcs_info_msg_0_} ${RESET}}'\
"${DIR_BG} %~ ${RESET} "

# Right-side prompt with clock
RPROMPT="${CLOCK_FG}%D{%H:%M}${RESET}"

# }}}

## User confs

# show stuff in new terminals except when recording terminal
if [[ "$ASCIINEMA_REC" != "1" ]]
then
  which fastfetch > /dev/null && fastfetch -c /usr/share/fastfetch/presets/examples/8.jsonc
fi

if type pyenv > /dev/null; then
  eval "$(pyenv init - zsh)"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# vim: foldmethod=marker
