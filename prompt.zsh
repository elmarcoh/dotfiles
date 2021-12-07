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

## timer function from https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
function preexec() {
  timer=$(date +%s%3N)
}

function precmd() {
  vcs_info
  if [ $timer ]; then
    local now=$(date +%s%3N)
    local d_ms=$(($now-$timer))
    local d_s=$((d_ms / 1000))
    local ms=$((d_ms % 1000))
    local s=$((d_s % 60))
    local m=$(((d_s / 60) % 60))
    local h=$((d_s / 3600))
    if ((h > 0)); then elapsed=${h}h${m}m
    elif ((m > 0)); then elapsed=${m}m${s}s
    elif ((s >= 10)); then elapsed=${s}.$((ms / 100))s
    elif ((s > 0)); then elapsed=${s}.$((ms / 10))s
    # else elapsed=${ms}ms
    else elapsed=""
    fi

    if [[ -n "$elapsed" ]]; then
      export ELAPSED="祥${elapsed}"
    else
      export ELAPSED=""
    fi
    unset timer
  fi
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

pillopn="%F{238}%}%K{238}%F{14}"
pillcls="%{$reset_color%}%F{238}"

zstyle ':vcs_info:git*' formats \
  "${pillopn} %b %m%u%c "
  # " %b" \
  # "%m%u%c% " \

zle-keymap-select () {
  case $KEYMAP in
    vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  esac
}

fpillopn="%F{14}%K{14}$fg_bold[black]"
fpillcls="%{$reset_color%}%F{14}"
bgtask="%(1j. .)"

NEWLINE=$'\n'
export PROMPT='${NEWLINE}${vcs_info_msg_0_}%{$fpillopn$bgtask%} %1d${fpillcls}${ELAPSED}%{$reset_color%}%F{0}%K{0} '
