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
- [Aloxaf/fzf-tab](https://github.com/Aloxaf/fzf-tab) — Fuzzy tab completion
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — Fish-like autosuggestions
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — Syntax highlighting
- [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use) — Reminds you to use aliases
- [zsh-bat](https://github.com/fdellwing/zsh-bat) — bat aliases

## Dependencies

**Fedora:**
```bash
sudo dnf install stow zsh neovim git zoxide fzf bat xclip
```

**macOS:**
```bash
brew install stow zsh neovim git zoxide fzf bat
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
