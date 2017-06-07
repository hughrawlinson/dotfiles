export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/Users/hugh/Library/Android/sdk/platform-tools"
export PATH="$PATH:/Users/hugh/Library/Android/sdk/build-tools"
export PATH="$PATH:/Users/hugh/Library/Android/sdk/tools"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/heroku/bin"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"
eval $(opam config env)
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
source ~/.cargo/env
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_GB.UTF-8
export EDITOR='mvim --remote-silent'
export ALTERNATE_EDITOR='vim'
export LESS="-erX"
export ZSH_THEME="agnoster"
export ENABLE_CORRECTION="true"
export COMPLETION_WAITING_DOTS="true"
export DEFAULT_USER="hugh"
export PKG_CONFIG_PATH=/usr/local/Cellar/libffi/3.0.13/lib/pkgconfig/:/usr/local/lib/pkgconfig:/usr/local/lib
