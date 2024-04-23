set FZF_TMUX_HEIGHT 100%

# Make sure to have user scripts in path
fish_add_path "$HOME/.local/bin"
fish_add_path /usr/local/sbin

set -gx GPG_TTY (tty)
set -gx TERMINAL alacritty

set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep"

set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

~/.local/bin/mise activate fish | source
