
. "$HOME/.local/bin/env"

alias vim="nvim"
alias atd="antidote"
alias lf="ls -lf"
alias la="ls -la"

path+=(
  ~/.bun/bin
)
export PATH

autoload -Uz compinit && compinit
source ~/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
antidote load

# fnm
FNM_PATH="/home/aidin/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env  --use-on-cd --shell zsh)"
fi

