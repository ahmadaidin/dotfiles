# dotfiles

My personal dotfiles for Fedora and macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

| Package | Description |
|---------|-------------|
| `zsh` | Zsh config with [Antidote](https://getantidote.github.io/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| `git` | Git global config |

## Zsh Plugins

- [ohmyzsh/git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) — Git aliases
- [ohmyzsh/sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo) — Press ESC twice to prepend sudo
- [ohmyzsh/extract](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract) — Extract any archive with `x`
- [ohmyzsh/copypath](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath) — Copy current path to clipboard
- [ohmyzsh/dirhistory](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory) — Navigate directory history with Alt+Left/Right
- [ohmyzsh/command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found) — Suggests packages for unknown commands
- [ohmyzsh/zoxide](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zoxide) — Zoxide integration
- [ohmyzsh/zsh-interactive-cd](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh-interactive-cd) — Interactive cd with fzf
- [ohmyzsh/alias-finder](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/alias-finder) — Suggests shorter aliases
- [ohmyzsh/aliases](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases) — Common shell aliases
- [Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab) — Fuzzy tab completion
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — Fish-like autosuggestions
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — Syntax highlighting
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) — History search with substring
- [fdellwing/zsh-bat](https://github.com/fdellwing/zsh-bat) — bat aliases

## Aliases

| Alias | Command |
|-------|---------|
| `vim` | `nvim` |
| `atd` | `antidote` |
| `lf` | `ls -lf` |
| `la` | `ls -la` |
| `o` | `opencode` |
| `osl` | `opencode session list` |
| `z` | `zed` |
| `nq` | `networkquality` (macOS only) |
| `wget` | `wget2` |
| `cup` | `clickup` |

## Dependencies

### Main dependencies
- zsh (built-in on macOS)
- git (built-in on macOS)
- antidote
- zoxide
- fzf
- bat
- xclip (Linux only)
- ripgrep
- fd

### Alias and Path dependencies
- bun
- pnpm
- fnm

## Installation

```bash
# Antidote (Zsh plugin manager)
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote

# Bun (JavaScript runtime, package manager, etc.)
curl -fsSL https://bun.sh/install | bash

# fnm (Node version manager)
curl -fsSL https://fnm.vercel.app/install | bash
fnm install --lts && fnm default lts

# pnpm (node package manager via Corepack)
npm install --global corepack@latest # Update corepack first (fixes outdated signatures issue)
corepack enable && corepack use pnpm@latest # Enable and use pnpm - corepack auto-downloads it
```

### macOS

```bash
# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone dotfiles
git clone https://github.com/ahmadaidin/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 3. Install all apps
brew bundle install

# MySQL Workbench (macOS)
# Download from https://dev.mysql.com/downloads/workbench/

# 4. Stow configs
stow zsh git
```

### Fedora

```bash
# 1. Install dependencies
sudo dnf install stow zsh git zoxide fzf bat xclip ripgrep fd

# 2. Clone dotfiles
git clone https://github.com/ahmadaidin/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 3. Stow configs
stow zsh git
```

## Secrets

Create `~/.secret.env` for API keys and credentials (excluded from dotfiles):

```bash
touch ~/.secret.env
chmod 600 ~/.secret.env
```

Add to `.secret.env`:
```bash
export API_KEY="your-key"
export DEEPSEEK_API_KEY="your-key"
```

The zshrc automatically loads `.secret.env` if it exists.

## Structure

```
dotfiles/
├── Brewfile              # macOS: all Homebrew packages (run brew bundle install)
├── zsh/
│   ├── .zshrc
│   ├── .zsh_plugins.txt
│   └── .p10k.zsh
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
```
