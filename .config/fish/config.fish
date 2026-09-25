if status is-interactive
    # Commands to run in interactive sessions can go here
    # Don't nest tmux sessions
    and not set -q TMUX
    # Only run in interactive shells
    exec tmux
end

/opt/homebrew/bin/brew shellenv | source

function vim
    nvim $argv
end

function ls
    eza $argv -l --icons
end

function lls
    /bin/ls $argv
end

function mkcd
    mkdir -p $argv && cd $argv[-1]
end

starship init fish | source
enable_transience
direnv hook fish | source

# Created by `pipx` on 2026-03-27 12:12:45
set PATH $PATH /Users/leonardo.marziali/.local/bin

# pnpm
set -gx PNPM_HOME "/Users/leonardo.marziali/Library/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# --- Claude Code multi-account setup ---
function claude-personal
    mkdir -p $HOME/.claude-personal
    env CLAUDE_CONFIG_DIR=$HOME/.claude-personal command claude $argv
end

# function claude-work
#     mkdir -p $HOME/.claude
#     env CLAUDE_CONFIG_DIR=$HOME/.claude command claude $argv
# end
