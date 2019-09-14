. /usr/local/opt/asdf/asdf.sh

autoload -U promptinit; promptinit
autoload -Uz compinit && compinit

export ZSH=$HOME/.oh-my-zsh
plugins=(osx zsh-syntax-highlighting brew)
ZSH_THEME=powerlevel10k/powerlevel10k
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source $ZSH/oh-my-zsh.sh
source ~/.purepower

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#   [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#       eval "$("$BASE16_SHELL/profile_helper.sh")"
