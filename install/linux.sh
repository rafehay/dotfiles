# ~/dotfiles/install/linux.sh
#!/usr/bin/env bash
set -e

echo "🐧 Linux Setup startet..."

echo "→ System updaten..."
sudo apt update && sudo apt upgrade -y

echo "→ Installiere Tools..."
sudo apt install -y \
  kitty \
  tmux \
  neovim \
  stow \
  git \
  curl \
  fzf \
  ripgrep \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting

echo "→ Installiere Nerd Font..."
mkdir -p ~/.local/share/fonts
curl -fLo ~/.local/share/fonts/JetBrainsMono.zip \
  https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o ~/.local/share/fonts/JetBrainsMono.zip -d ~/.local/share/fonts/
fc-cache -fv

echo "→ Installiere Starship (nicht in apt)..."
curl -sS https://starship.rs/install.sh | sh

echo "→ Wechsle Standard-Shell zu zsh..."
chsh -s $(which zsh)

echo "→ Symlinks mit Stow setzen..."
cd ~/dotfiles
stow zsh kitty tmux starship nvim

echo "→ Erstelle leere .zshrc.local falls nicht vorhanden..."
[ -f ~/.zshrc.local ] || cat > ~/.zshrc.local << 'EOF'
# Maschinen-spezifische Configs – wird nicht ins Repo gepusht
export GIT_AUTHOR_NAME="Rafeh Rafeh"
export GIT_AUTHOR_EMAIL="rafeh.ra@hotmail.com"
EOF

echo "✅ Linux Setup fertig! Terminal neu starten oder: exec zsh"
