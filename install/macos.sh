# ~/dotfiles/install/macos.sh
#!/usr/bin/env bash
set -e

echo "🍎 macOS Setup startet..."

# Homebrew installieren falls nicht vorhanden
if ! command -v brew &>/dev/null; then
  echo "→ Installiere Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "→ Installiere Tools..."
brew install \
  kitty \
  tmux \
  starship \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  neovim \
  stow \
  git \
  fzf \
  ripgrep

brew install --cask font-jetbrains-mono-nerd-font

echo "→ Symlinks mit Stow setzen..."
cd ~/dotfiles
stow zsh kitty tmux starship nvim

echo "→ Erstelle leere .zshrc.local falls nicht vorhanden..."
[ -f ~/.zshrc.local ] || cat > ~/.zshrc.local << 'EOF'
# Maschinen-spezifische Configs – wird nicht ins Repo gepusht
export GIT_AUTHOR_NAME="Rafeh Rafeh"
export GIT_AUTHOR_EMAIL="rafeh.ra@hotmail.com"
EOF

echo "✅ macOS Setup fertig! Terminal neu starten."
