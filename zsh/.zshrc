# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Auto cd to directory when typing directory name
setopt AUTO_CD

# ---------- Locale ----------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Enable colored ls
export CLICOLOR=1

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
alias zd="zed"
alias cup="clickup"
alias rr="rm -rf"

# ---------- Prompt ----------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ---------- Secrets ----------
if [[ -f "$HOME/.secret.env" ]]; then
  source "$HOME/.secret.env"
fi

# ---------- bun completions ----------
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export FZF_DEFAULT_OPTS='
  --preview "tree -C {} | head -50"
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
'

zi() {
  local dir
  dir=$(zoxide query -l | fzf) && z "$dir"
}

zr() {
  local dir
  dir=$(zoxide query -l | sort -k2 -rn | fzf)
  [ -n "$dir" ] && z "$dir"
}

zfp() {
  local dir
  dir=$(zoxide query -l | fzf --preview 'tree -L 2 {}')
  [ -n "$dir" ] && z "$dir" && ls -la
}

zdev() {
  local dir
  dir=$(zoxide query -l | grep -i Dev | fzf)
  [ -n "$dir" ] && z "$dir"
}

zxp() {
  local dir
  dir=$(zoxide query -l | grep -i Explore | fzf)
  [ -n "$dir" ] && z "$dir"
}
