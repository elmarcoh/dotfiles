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
zstyle ':vcs_info:*' stagedstr ' '
zstyle ':vcs_info:*' unstagedstr ' '
precmd() {
    vcs_info
}

function unpushed() {
  ahead=$(2>/dev/null git log --oneline @{u}..|wc -l)
  behind=$(2>/dev/null git log --oneline ..@{u}|wc -l)
  if [[ ( $ahead -gt 0 ) && ( $behind -gt 0 ) ]]; then
    echo ''
  elif [ $ahead -gt 0 ]; then
    echo ''
  elif [ $behind -gt 0 ]; then
    echo ''
  fi
}

zstyle ':vcs_info:git*' formats \
  "%{$fg[cyan]%}%{$bg[cyan]$fg_bold[black]%} %b%m%u%c% $(unpushed) %{$bg[grey]$fg[cyan]%} "

export PROMPT='%{$fg[grey]%}${vcs_info_msg_0_:-}%{$fg[cyan]$bg[grey]%} %1d%{$reset_color$fg[grey]%}%{$reset_color%} '
