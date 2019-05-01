autoload -U promptinit; promptinit
source ~/.fresh/build/shell.sh

##
#  path
##

export GOPATH="$HOME/.go"
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:/usr/local/opt/make/libexec/gnubin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

if [[ -e "$HOME/.pc_path" ]]; then
  export PKG_CONFIG_PATH=$(cat "$HOME/.pc_path")
else
  export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
fi

## 
#  oh-my-zsh
##

export ZSH=$HOME/.oh-my-zsh
plugins=(osx zsh-syntax-highlighting brew)
ZSH_THEME=powerlevel10k/powerlevel10k
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source $ZSH/oh-my-zsh.sh
source ~/.purepower

## 
#  NVM
## 

. "/usr/local/opt/nvm/nvm.sh"

##
#  rbenv
##

eval "$(rbenv init -)"

##
#  z
##

. /usr/local/etc/profile.d/z.sh

