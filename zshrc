#!/bin/zsh

export GOPATH="$HOME/.go"
export NVM_DIR="$HOME/.nvm"

##
#  path
##

export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

## 
#  oh-my-zsh
##

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=""
plugins=(zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt pure

## 
#  NVM
## 

. "/usr/local/opt/nvm/nvm.sh"

##
#  Base16 Shell
## 

# BASE16_SHELL="$HOME/repos/base16-shell/scripts/base16-bright.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export HOMEBREW_NO_GITHUB_API=1

##
#  My stuff
##

export VISUAL="vim"
export EDITOR="vim"

# alias mls (mac ls) to system ls
alias mls=/bin/ls

# alias ls to gls (gnu ls)
alias ls="gls -N --color"

# alias lx to list directories pretty.
# -N: no quotes around files with spaces. this is probably bad but I think
# that's ugly
# -X: sort by extension
# -p: trailing / on directories/
# list directories first
# colorize output
alias lx="gls --group-directories-first --color -NXp"

alias stat="stat -x"
alias serve="python -m SimpleHTTPServer"
alias git=hub
alias pip=pip3
alias python=python3

function upgrade {
    echo "MAS:"
    mas outdated
    echo "use 'mas upgrade' to upgrade these packages"
    echo
    echo "npm update -g"
    echo "gem update"
    echo "pip"
}

function brewski {
    brew update
    brew upgrade
    brew cleanup -s
    brew cask cleanup
    brew doctor
    brew missing
}

##
#  iTerm2
##

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

##
#  Luna studio
##

export PATH=/Users/harry/.local/bin:$PATH
