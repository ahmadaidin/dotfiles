# dotfiles

My personal dotfiles for Fedora and macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

| Package | Description |
|--------|-------------|
| `zsh` | Zsh config with [Antidote](https://getantidote.github.io/) plugin manager |
| `nvim` | Neovim config |
| `git` | Git global config |
| `starship` | [Starship](https://starship.rs/) prompt config |

## Zsh Plugins

- [ohmyzsh/git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) — Git aliases
- [ohmyzsh/sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo) — Press ESC twice to prepend sudo
- [ohmyzsh/extract](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract) — Extract any archive with `x`
- [ohmyzsh/copypath](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath) — Copy current path to clipboard
- [ohmyzsh/dirhistory](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory) — Navigate directory history with Alt+Left/Right
- [ohmyzsh/command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found) — Suggests packages for unknown commands
- [ohmyzsh/zoxide](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zoxide) — Zoxide integration
- [ohmyzsh/starship](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/starship) — Starship prompt integration
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

## Dependencies

**Fedora:**
```bash
sudo dnf install stow zsh neovim git zoxide fzf bat xclip ripgrep fd
```

**macOS:**
```bash
brew install stow zsh neovim git zoxide fzf bat ripgrep fd
```

## Installation

```bash
git clone https://github.com/ahmadaidin/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh git starship nvim
```

## Structure

```
dotfiles/
├── zsh/
│   ├── .zshrc
│   └── .zsh_plugins.txt
├── nvim/
│   └── .config/nvim/
├── git/
│   └── .gitconfig
└── starship/
    └── .config/
        └── starship.toml
```