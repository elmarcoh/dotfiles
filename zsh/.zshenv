# envvars
export EDITOR="nvim"

# CLICOLOR is for mac
if 2>/dev/null ls --color &>/dev/null; then
  alias ls="ls --color=auto"
else
  export CLICOLOR=1
fi

# ls
alias ll="lsd -l"
alias lla="lsd -la"
alias la="ls -a"

alias cp="cp -i"  # ask before overwritting

# Git stuff
alias gst="git status"
alias gp="git pull --rebase"
alias gfetch="git fetch"
alias gsave="git stash save"
alias gpop="git stash pop"
alias gci="git commit"
alias gn="git-number"
alias glog="git log --stat"
alias glg="git log --oneline"

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

[[ -f $HOME/.env ]] && source $HOME/.env
[[ -d $HOME/go/bin ]] && path+=($HOME/go/bin)
