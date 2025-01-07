if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # Set environment variables
    set -gx EDITOR nvim
    set -gx VISUAL $EDITOR
    set -gx TERM xterm-256color

    # Path modifications
    fish_add_path /opt/homebrew/bin
    fish_add_path $HOME/.local/bin

    # Aliases
    alias vim='nvim'
    alias vi='nvim'
    alias ls='ls -G'
    alias ll='ls -lah'
    alias g='git'
    alias gc='git commit'
    alias gp='git push'
    alias gpl='git pull'
    alias gs='git status'
    alias gd='git diff'
    alias ga='git add'
    alias gco='git checkout'
    alias gl='git log'

    # Custom functions
    function mkcd
        mkdir -p $argv[1] && cd $argv[1]
    end

    # Git abbreviations
    abbr -a gst git status
    abbr -a gco git checkout
    abbr -a gaa git add --all
    abbr -a gcm git commit -m
    abbr -a gpl git pull
    abbr -a gps git push
    abbr -a glo git log --oneline

    # Fish greeting
    function fish_greeting
        echo "Welcome to Fish shell! 🐟"
    end

    # Better command history with fzf
    if type -q fzf
        bind \cr 'history | fzf | read -l result; and commandline -- $result'
    end

    # Homebrew
    if test -d /opt/homebrew
        eval (/opt/homebrew/bin/brew shellenv)
    end

    # Node Version Manager (nvm)
    if test -d $HOME/.nvm
        set -gx NVM_DIR $HOME/.nvm
    end

    # Starship prompt (if installed)
    if type -q starship
        starship init fish | source
    end
end
