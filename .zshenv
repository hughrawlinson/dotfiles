export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Users/hugh/Library/Android/sdk/platform-tools"
export PATH="$PATH:/Users/hugh/Library/Android/sdk/build-tools"
export PATH="$PATH:/Users/hugh/Library/Android/sdk/tools"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/heroku/bin"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_GB.UTF-8
export EDITOR='mvim --remote-silent'
export ALTERNATE_EDITOR='vim'
export LESS="-erX"
export ZSH_THEME="agnoster"
export ENABLE_CORRECTION="true"
export COMPLETION_WAITING_DOTS="true"
# Not joking, this is how to detect if you're running in emacs exec-path-from-shell
# if [[ $- == *i* && "$PAGER" != "cat" ]]; then; export ZSH_TMUX_AUTOSTART="true"; fi;
export DEFAULT_USER="hugh"
#export TERM="xterm-256color"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/:/usr/local/lib/pkgconfig:/usr/local/lib
