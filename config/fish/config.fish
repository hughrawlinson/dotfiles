if test -z "$EDITOR"
    set -gx EDITOR code
end

if test -z "$GITEDITOR"
    set -gx GITEDITOR nvim
end

set FZF_TMUX_HEIGHT 100%

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin edc/bass
fundle plugin tuvistavie/fish-ssh-agent
fundle plugin brigand/fast-nvm-fish
fundle init

if status --is-interactive
    bind -k f4 edit_cmd
    commandline -f execute
    # if setxkbmap, swap caps and esc
    if test Darwin != (uname -a | cut -d' ' -f1)
        if type -q setxkbmap
            setxkbmap -option caps:swapescape
        end
    else
        defaults write -g ApplePressAndHoldEnabled -bool false
    end
    # Keybinding to refresh fish config
    bind -k f5 eval "source $HOME/.config/fish/config.fish"
end

# Make sure to have user scripts in path
fish_add_path "$HOME/.local/bin"


set -gx GPG_TTY (tty)
set DISPLAY ":0"
fish_add_path /usr/local/sbin
alias emsdk_setup "source $HOME/emsdk/emsdk_env.fish"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]
    . '$HOME/google-cloud-sdk/path.fish.inc'
end

alias copy "xclip -selection clipboard"

if type -fq zoxide
    zoxide init fish | source
end

nvm use default

set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep"
