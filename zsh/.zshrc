
. "$HOME/.local/bin/env"

# aliases
alias vim="nvim"
alias atd="antidote"
alias lf="ls -lf"
alias la="ls -la"

## opencode
alias o="opencode"
alias osl="opencode session list"

# path
path+=(
  ~/.bun/bin
)
export PATH

autoload -Uz compinit && compinit
source ~/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
antidote load

zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' exact yes

# fnm
FNM_PATH="~/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env  --use-on-cd --shell zsh)"
fi

