# envvars
export EDITOR="nvim"
# CLICOLOR is for mac
eval "$(2>/dev/null dircolors || echo export CLICOLOR=1)"

# ls
alias ll="lsd -l"
alias lla="lsd -la"
alias la="ls -a"
alias lla="ls -la"

# Git stuff
alias gst="git status"
alias gpull="git pull --rebase"
alias gssave="git stash save"
alias gspop="git stash pop"
alias gn="git-number"
