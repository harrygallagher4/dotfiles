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
export PATH="$PATH:/Users/harry/anaconda3/bin"
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

alias stat="stat -x"
alias serve="python -m SimpleHTTPServer"
alias git=hub

##
#  iTerm2
##

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
