autoload -U promptinit; promptinit
autoload -Uz compinit && compinit

source ~/.fresh/build/shell.sh

export ZSH=$HOME/.oh-my-zsh
plugins=(osx zsh-syntax-highlighting brew)
ZSH_THEME=powerlevel10k/powerlevel10k
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source $ZSH/oh-my-zsh.sh
source ~/.purepower

