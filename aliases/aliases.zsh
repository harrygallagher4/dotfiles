# alias lx to list directories pretty.
# -N: no quotes around files with spaces. this is probably bad but I think
# that's ugly
# -X: sort by extension
# -p: trailing / on directories/
# list directories first
# colorize output
alias lx="gls --group-directories-first --color -NXp"

alias serve="python -m SimpleHTTPServer"
alias gman=man-preview
alias pip=pip3
alias python=python3
alias brews="brew list -1"
alias vim="nvim"
eval "$(hub alias -s)"
