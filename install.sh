#!/bin/bash

# Dotfiles installation script
# Run this after cloning your dotfiles repo

echo "Setting up dotfiles..."

# Configure git to not show untracked files
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

# Set up the dotfiles alias for bash/zsh
if [ -f "$HOME/.bashrc" ]; then
  if ! grep -q "alias dotfiles=" "$HOME/.bashrc"; then
    echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >>"$HOME/.bashrc"
    echo "Added dotfiles alias to .bashrc"
  fi
fi

if [ -f "$HOME/.zshrc" ]; then
  if ! grep -q "alias dotfiles=" "$HOME/.zshrc"; then
    echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >>"$HOME/.zshrc"
    echo "Added dotfiles alias to .zshrc"
  fi
fi

# Set up the dotfiles function for fish
if [ -d "$HOME/.config/fish" ]; then
  mkdir -p "$HOME/.config/fish/functions"
  cat >"$HOME/.config/fish/functions/dotfiles.fish" <<'EOF'
function dotfiles
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end
EOF
  echo "Added dotfiles function to Fish"
fi

echo "Setup complete!"
echo ""
echo "Usage:"
echo "  dotfiles status"
echo "  dotfiles add .vimrc"
echo "  dotfiles commit -m 'Update vimrc'"
echo "  dotfiles push"
