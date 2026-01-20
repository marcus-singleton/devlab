#!/bin/bash
set -e

echo "📦 Setting up user environment..."

DOTFILES_DIR="/workspaces/devlab/.devcontainer/dotfiles"

# Install user tools
echo "📦 Installing user tools..."
sudo apt-get update
sudo apt-get install -y \
    neovim \
    vim \
    tmux \
    ripgrep \
    fd-find \
    fzf

# Copy dotfiles
echo "📝 Copying dotfiles..."
cp "${DOTFILES_DIR}/.bashrc" ~/.bashrc
cp "${DOTFILES_DIR}/.tmux.conf" ~/.tmux.conf
cp "${DOTFILES_DIR}/.vimrc" ~/.vimrc 2>/dev/null || true

# Neovim config
mkdir -p ~/.config/nvim
cp -r "${DOTFILES_DIR}/nvim/"* ~/.config/nvim/

# Vim undodir
mkdir -p ~/.vim/undodir

# FZF
if [ ! -d ~/.fzf ]; then
    echo "📦 Installing FZF..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi

# Fix ownership
sudo chown -R dev:dev /home/dev

echo "✅ User environment ready!"

