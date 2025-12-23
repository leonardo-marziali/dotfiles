# Dotfiles

My personal configuration files managed with a bare Git repository.

## Installation on a new machine

### 1. Clone the repository

```bash
git clone --bare https://github.com/leonardo-marziali/dotfiles.git $HOME/.dotfiles
```

### 2. Checkout the files

```bash
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
```

**Note:** If you get errors about existing files, you may need to back them up or remove them first:

```bash
mkdir -p .config-backup
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
```

Then try checkout again.

### 3. Run the install script

```bash
chmod +x ~/install.sh
~/install.sh
```

This will:
- Configure Git to hide untracked files
- Set up the `dotfiles` command/alias for your shell

### 4. Reload your shell

```bash
# For bash/zsh
source ~/.bashrc  # or ~/.zshrc

# For fish
source ~/.config/fish/config.fish
```

## Usage

After installation, use the `dotfiles` command instead of `git`:

```bash
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Update vimrc"
dotfiles push
```

## What's included

- Shell configurations (bash, zsh, fish)
- Neovim configuration
- Ghostty terminal configs
- Tmux configuration
