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
zstyle ':vcs_info:*' stagedstr ' '
zstyle ':vcs_info:*' unstagedstr ''
precmd() {
    vcs_info
}

# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.
# Make sure you have added misc to your 'formats':  %m
zstyle ':vcs_info:git*+set-message:*' hooks git-st
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    # Exit early in case the worktree is on a detached HEAD
    git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

    local -a ahead_and_behind=(
        $(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream} 2>/dev/null)
    )

    ahead=${ahead_and_behind[1]}
    behind=${ahead_and_behind[2]}

    (( $ahead )) && (( $behind  )) && gitstatus+=( " " )
    (( $ahead )) && ! (( $behind )) && gitstatus+=( " " )
    (( $behind )) && ! (( $ahead )) && gitstatus+=( " " )


    hook_com[misc]+=${(j:/:)gitstatus}
}

zstyle ':vcs_info:git*' formats \
  "%{$fg[cyan]%}%{$bg[cyan]$fg_bold[black]%} %b %{$fg[magenta]%}%m%u%c% %{$reset_color$fg[cyan]%} "
  # " %b" \
  # "%m%u%c% " \

zle-keymap-select () {
  case $KEYMAP in
    vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  esac
}

NEWLINE=$'\n'
export PROMPT='${NEWLINE}%(1j.%{$fg_bold[yellow]%}%(2j.鬒.).)%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color$fg[cyan]%}  %1d%  ❱ %{$reset_color%}'
