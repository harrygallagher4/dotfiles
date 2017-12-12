#!/bin/zsh

export GOPATH="$HOME/.go"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/harry/anaconda3/bin:$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:/Users/harry/scripts"

. /Users/harry/repos/torch/install/bin/torch-activate

export ZSH=$HOME/.oh-my-zsh

plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

# source $HOME/.config/powerline.sh

# Base16 Shell
# BASE16_SHELL="$HOME/repos/base16-shell/scripts/base16-bright.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export HOMEBREW_NO_GITHUB_API=1

# My stuff
export VISUAL="vim"
export EDITOR="vim"

alias stat="stat -x"
alias serve="python -m SimpleHTTPServer"
alias git=hub

# alias git-update="ls | xargs -I{} sh -c '[[ -d {}/.git ]] && [[ $(git -C {} diff --shortstat 2> /dev/null | tail -n1) == "" ]] && [[ $(git -C {} remote) != "" ]] && echo {}: && git -C {} pull'"

ilost() {
    echo "*$@*"
    sudo find / -iname "*$@*"
}

#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

