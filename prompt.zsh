#
# https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Shell-state
#

setopt prompt_subst
autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ''
zstyle ':vcs_info:*' unstagedstr ' '
precmd() {
    vcs_info
}

zstyle ':vcs_info:git*' formats \
  "%{$fg[cyan]%}%{$bg[cyan]$fg[black]%} %b%{$fg[black]%} %m%u%c% %{$bg[grey]$fg[cyan]%} "

export PROMPT='%{$fg[grey]%}${vcs_info_msg_0_:-}%{$fg[cyan]$bg[grey]%}  %1d%{$reset_color$fg[grey]%}%{$reset_color%} '
