if test -z "$EDITOR"
    set -gx EDITOR code
end

if test -z "$GITEDITOR"
    set -gx GITEDITOR nvim
end

set FZF_TMUX_HEIGHT 100%

if status --is-interactive
    # if setxkbmap, swap caps and esc
    if test Darwin != (uname -a | cut -d' ' -f1)
        if type -q setxkbmap
            setxkbmap -option caps:swapescape
        end
    else
        defaults write -g ApplePressAndHoldEnabled -bool false
    end
end

# Make sure to have user scripts in path
fish_add_path "$HOME/.local/bin"
fish_add_path /usr/local/sbin

set -gx GPG_TTY (tty)
set DISPLAY ":0"

set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep"

set -gx ASDF_DIR "$HOME/.asdf"
set -gx ASDF_DATA_DIR "/mnt/e/.hugh_asdf"

# source $ASDF_DIR/asdf.fish
