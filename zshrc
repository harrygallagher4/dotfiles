autoload -U promptinit; promptinit

export GOPATH="$HOME/.go"
export NVM_DIR="$HOME/.nvm"

##
#  path
##

export PATH="$PATH:/usr/local/opt/make/libexec/gnubin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

export PKG_CONFIG_PATH=$(cat "$HOME/.pc_path")

## 
#  oh-my-zsh
##

export ZSH=$HOME/.oh-my-zsh
plugins=(osx zsh-syntax-highlighting brew)
ZSH_THEME=powerlevel10k/powerlevel10k
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source $ZSH/oh-my-zsh.sh
source ~/.purepower

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^l' push-line-or-edit

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

##
#  homebrew
##

export HOMEBREW_NO_GITHUB_API=1

##
#  My stuff
##

export VISUAL="vim"
export EDITOR="vim"

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

alias brews="brew list -1"

function brewski {
    brew update
    brew upgrade
    brew cleanup -s
    brew doctor
    brew missing
}

function blockblock {
    /Library/Objective-See/BlockBlock/BlockBlock.app/Contents/MacOS/BlockBlock -unhide
}

##
#  iTerm2
##

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


