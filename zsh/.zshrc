# ---------- Instant Prompt ----------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---------- Core Paths (shared) ----------
path=(
  /usr/local/bin
  /usr/local/go/bin
  $HOME/bin
  $HOME/.local/bin
  $HOME/.bun/bin
  $path
)
export PATH

# ---------- Platform Detection ----------
if [[ $(uname) == Darwin ]]; then
  # ---------- macOS Paths ----------
  path=(
    /opt/homebrew/opt/php@8.3/bin
    /opt/homebrew/opt/mysql-client/bin
    /opt/homebrew/opt/libpq/bin
    $HOME/.phpenv/bin
    $HOME/Library/pnpm
    $HOME/.bun/bin
    $path
  )

  # ---------- macOS Env ----------
  export PNPM_HOME="$HOME/Library/pnpm"

  # ---------- macOS-only Aliases ----------
  alias nq="networkquality"
  alias brew-dump="rm Brewfile && brew bundle dump --file=Brewfile"
else
  # ---------- Fedora ----------
  . "$HOME/.local/bin/env"
fi

# ---------- Antidote Plugins ----------
autoload -Uz compinit && compinit
source $HOME/.antidote/antidote.zsh
antidote load

zstyle ':omz:plugins:alias-finder' autoload yes
zstyle ':omz:plugins:alias-finder' exact yes

# ---------- fnm ----------
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# ---------- Aliases ----------
alias vim="nvim"
alias atd="antidote"
alias wget="wget2"
alias lf="ls -lf"
alias la="ls -la"
alias o="opencode"
alias osl="opencode session list"
alias z="zed"
alias cup="clickup"

# ---------- Prompt ----------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ---------- Secrets ----------
if [[ -f "$HOME/.secret.env" ]]; then
  source "$HOME/.secret.env"
fi

# ---------- bun completions ----------
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
