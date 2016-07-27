export ZSH=/Users/hugh/.oh-my-zsh

ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode)

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:/usr/local/heroku/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/Library/Android/sdk/build-tools"
export PATH="$PATH:$HOME/Library/Android/sdk/tools"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"

eval "$(rbenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LANG=en_GB.UTF-8
export EDITOR='emacsclient'
export ALTERNATE_EDITOR='vim'
export TERM="screen-256color"

export NVM_DIR="/Users/hugh/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -f /Users/hugh/.travis/travis.sh ] && source /Users/hugh/.travis/travis.sh

alias tmux="tmux -2"
alias spm='npm --registry http://npm-registry.spotify.net --userconfig ~/.spmrc --always-auth=true'
alias g='git'
alias ec='emacsclient -n -a ""'
alias ds='docker-machine start default && docker-machine env default'
eval "$(grunt --completion=zsh)"
source ~/.cargo/env
#DOCKERMACHINE=$(which docker-machine)
#docker_machine_is_up=$(docker-machine ls | grep running > /dev/null 2>&1)
#if [ $docker_machine_is_up -eq 0 ] && [ ! -z "$DOCKERMACHINE" ];
#then
#    DOCKERMACHINE_NAME=$($DOCKERMACHINE ls -q)
#    eval "$("$DOCKERMACHINE" env "$DOCKERMACHINE_NAME")"
#fi
eval $(docker-machine env default)

function loadenv() { cat .env | while read a; do export $a; done }

# The next line updates PATH for the Google Cloud SDK.
source '/Users/hugh/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/hugh/google-cloud-sdk/completion.zsh.inc'

autoload -U compinit && compinit
zmodload -i zsh/complist
