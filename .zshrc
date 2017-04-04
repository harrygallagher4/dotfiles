#!/bin/zsh

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/harry/anaconda3/bin:$PATH"
export ZSH=$HOME/.oh-my-zsh

plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

source $HOME/.config/powerline.sh

# Base16 Shell
BASE16_SHELL="$HOME/repos/base16-shell/scripts/base16-3024.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export HOMEBREW_NO_GITHUB_API=1

# My stuff
export VISUAL="nvim"

alias stat="stat -x"
alias atomic="osascript ~/repos/iterm-workspace/Atomic\ Workspace.scpt"
alias serve="python -m SimpleHTTPServer"
alias vvim="/usr/local/bin/vim -u $HOME/Projects/pvim/essential.vim -N"

alias git=hub
alias fuck='TF_CMD=$(TF_ALIAS=fuck PYTHONIOENCODING=utf-8 TF_SHELL_ALIASES=$(alias) thefuck $(fc -ln -1 | tail -n 1)) && eval $TF_CMD ; test -n "$TF_CMD" && print -s $TF_CMD'

# alias git-update="ls | xargs -I{} sh -c '[[ -d {}/.git ]] && [[ $(git -C {} diff --shortstat 2> /dev/null | tail -n1) == "" ]] && [[ $(git -C {} remote) != "" ]] && echo {}: && git -C {} pull'"
