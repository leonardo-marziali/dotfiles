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

starship init fish | source
enable_transience
