export ZSH=/Users/hugh/.oh-my-zsh

ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git vi-mode)

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
export EDITOR='vim'
export TERM="screen-256color"

export NVM_DIR="/Users/hugh/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -f /Users/hugh/.travis/travis.sh ] && source /Users/hugh/.travis/travis.sh

# Disabling this until I can find a sane install procedure
#. /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh
alias tmux="tmux -2"
alias spm='npm --registry http://npm-registry.spotify.net --userconfig ~/.spmrc --always-auth=true'
alias g='git'
alias ec='emacsclient -n -a ""'
eval "$(docker-machine env default)"
eval "$(hub alias -s)"
eval "$(grunt --completion=zsh)"

function loadenv() { cat .env | while read a; do export $a; done }

# The next line updates PATH for the Google Cloud SDK.
source '/Users/hugh/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/hugh/google-cloud-sdk/completion.zsh.inc'
