#!/bin/zsh
#
export PATH="$PATH:/usr/local/bin"
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/sbin:$PATH"

ZSH_THEME="agnoster"

source $ZSH/oh-my-zsh.sh

# Base16 Shell
BASE16_CONTRAST="dark"
BASE16_THEME="railscasts"
BASE16_SHELL="$HOME/repos/base16-shell/base16-$BASE16_THEME.$BASE16_CONTRAST.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# NVM
export NVM_DIR=~/.nvm
[[ -r $(brew --prefix nvm)/etc/bash_completion.d/nvm ]] && . $(brew --prefix nvm)/etc/bash_completion.d/nvm
source $(brew --prefix nvm)/nvm.sh

# rbenv
eval "$(rbenv init -)"

# added by travis gem
[ -f /Users/harry/.travis/travis.sh ] && source /Users/harry/.travis/travis.sh

# My stuff
export VISUAL="nvim"

alias stat="stat -x"
alias vim="nvim"
alias atomic="osascript ~/repos/iterm-workspace/Atomic\ Workspace.scpt"

eval "$(thefuck --alias)"
eval "$(hub alias -s)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
