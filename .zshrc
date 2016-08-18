export ZSH=/Users/hugh/.oh-my-zsh

# Oh My ZSH
plugins=(git common-aliases npm nyan tmux)
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
[ -f /Users/hugh/.travis/travis.sh ] && source /Users/hugh/.travis/travis.sh
source ~/.cargo/env
if which docker-machine > /dev/null; then eval "$(docker-machine env default)"; fi

alias tmux="tmux -2"
alias spm='npm --registry http://npm-registry.spotify.net --userconfig ~/.spmrc --always-auth=true'
alias ghci="stack ghci"
alias ghc="stack ghc"
alias npm-exec='PATH=$(npm bin):$PATH'
alias ec="emacsclient --no-wait"
alias e="$EDITOR"
alias ds='docker-machine start default && docker-machine env default'

function loadenv() { cat .env | while read a; do export $a; done }
