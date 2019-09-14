export GOPATH="$HOME/.go"
export NVM_DIR="$HOME/.nvm"
export PATH="$PATH:/usr/local/opt/make/libexec/gnubin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:$HOME/dev/flutter/bin"
export PATH="$PATH:$HOME/.roswell/bin"
export NODE_PATH="/usr/local/lib/node_modules/"

if [[ -e "$HOME/.pc_path" ]]; then
  export PKG_CONFIG_PATH=$(cat "$HOME/.pc_path")
else
  export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
fi

source ~/.fresh/build/shell.sh

export FZF_DEFAULT_COMMAND='fd -H --type f'
