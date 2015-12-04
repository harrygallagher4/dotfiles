export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Base16 Shell
BASE16_CONTRAST="dark"
BASE16_THEME="bright"
BASE16_SHELL="$HOME/repos/base16-shell/base16-$BASE16_THEME.$BASE16_CONTRAST.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
export PATH="/usr/local/sbin:$PATH"

export VISUAL="vim"

alias stat="stat -x"
alias vim="nvim"
