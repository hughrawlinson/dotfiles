export ZSH=/Users/hugh/.oh-my-zsh

# Oh My ZSH
ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -f /Users/hugh/.travis/travis.sh ] && source /Users/hugh/.travis/travis.sh

alias tmux="tmux -2"
alias spm='npm --registry http://npm-registry.spotify.net --userconfig ~/.spmrc --always-auth=true'
if which docker-machine > /dev/null; then eval "$(docker-machine env default)"; fi

alias ghci="stack ghci"
alias ghc="stack ghc"
alias npm-exec='PATH=$(npm bin):$PATH'
alias e="$EDITOR"

function loadenv() { cat .env | while read a; do export $a; done }
