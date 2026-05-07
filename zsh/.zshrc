
. "$HOME/.local/bin/env"

alias vim="nvim"
alias atd="antidote"
alias lf="ls -lf"
alias la="ls -la"

path+=(
  ~/.bun/bin
)
export PATH

eval "$(starship init zsh)"

autoload -Uz compinit && compinit
source ~/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
antidote load
