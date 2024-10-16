# envvars
export EDITOR="nvim"

# CLICOLOR is for mac
if 2>/dev/null ls --color &>/dev/null; then
  alias ls="ls --color=auto"
else
  export CLICOLOR=1
fi

alias grep="grep --color=auto"

# ls -> eza
alias eza="eza --icons --group-directories-first"
alias ls="eza"
alias ll="eza -l"
alias lla="eza -la"

alias cp="cp -i"  # ask before overwritting

# Git stuff
alias gg="git status"
alias gfetch="git fetch --all"

alias gcm="git commit"
alias gco="git checkout"
alias gadd="git status -s\
  |grep '^\s'|cut -c1-|fzf -m --height=45% --preview='git diff --color -- \$(echo {}|cut -c3-)'\
  |cut -c3-|xargs git add"
alias gsw="git branch|cut -c3-|fzf --height=45% --preview='git log -3 --stat --color {}'|xargs -I{} git switch \"{}\""
alias gswr="git branch -r|cut -c3-|fzf --height=45% --preview='git log -3 --stat --color {}'|cut -d'/' -f2-|xargs -I{} git switch \"{}\""
alias gpull="git pull --rebase"
alias gpll="git pull --rebase"
alias gpss="git push"

alias gll="git log --stat"
alias glo="git log --oneline"

alias gdd='git diff'
alias gddc='git diff --cached'

# docker
alias dcp='docker compose'

alias nvim-godot='nvim --listen ~/.cache/nvim/godot.pipe'

#easily load .env files with variables
function envfileload() {
  if [ -f "$1" ]; then
    export $(grep -oe "^\w\+=.*" "$1"|xargs)
  else
    echo "file \`$1\` not found"
  fi
}

# list processes swap usage
function swap_usage() {
  column --table --separator=$'\t' <<< $(
    echo "SIZE\tPID\tCMD"
    for size pid in $(grep --color Swap /proc/*/status|rg '/proc/([0-9]+)/[^:]+:[^:]+:\s+([0-9]+)' -or '$2 $1'|sort -nr|head -20); do
      [ "$size" -gt 0 ] && printf "%s kb\t%s\t%s\n" $size $pid "$(ps -p $pid -o cmd --no-headers)"
    done
  )
}

# Useful clipboard thingies
if type xsel > /dev/null; then
  alias xcopy="xsel -ib"
  alias xpaste="xsel -ob"
  alias dirclip="echo $PWD|xcopy"
fi

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R

#AWS stuff
export AWS_PAGER=""

# Use multiple cores for `xz` compression
# setting to 0 will make it use all cores
export XZ_DEFAULTS="-T 3"

[[ -f $HOME/.env ]] && source $HOME/.env
[[ -d $HOME/go/bin ]] && path+=($HOME/go/bin)
[[ -d $HOME/bin ]] && path+=($HOME/bin)
[[ -f $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh
[[ -f $HOME/.config/godotenv/godot/bin ]] && godot=$HOME/.config/godotenv/godot/bin
