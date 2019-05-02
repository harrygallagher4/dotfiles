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

