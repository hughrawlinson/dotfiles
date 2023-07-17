set FZF_TMUX_HEIGHT 100%

# Make sure to have user scripts in path
fish_add_path "$HOME/.local/bin"
fish_add_path /usr/local/sbin

set -gx GPG_TTY (tty)
set -gx TERMINAL alacritty

set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep"

~/.local/bin/rtx activate fish | source
