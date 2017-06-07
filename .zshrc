export ZSH=/Users/hugh/.oh-my-zsh

# Oh My ZSH
plugins=(git common-aliases npm nyan tmux)
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
[ -f /Users/hugh/.travis/travis.sh ] && source /Users/hugh/.travis/travis.sh
source ~/.cargo/env
eval $(opam config env)

alias tmux="tmux -2"
alias spm='npm --registry https://artifactory.spotify.net/artifactory/api/npm/virtual-npm --userconfig ~/.spmrc --always-auth=true'
alias ghci="stack ghci"
alias ghc="stack ghc"
alias npm-exec='PATH=$(npm bin):$PATH'
#alias ec="emacsclient --no-wait -c"
#alias e="emacsclient -t"
alias em="emacsclient -t"
alias e="$EDITOR"
alias ds='docker-machine start default && docker-machine env default'

function loadenv() { cat .env | while read a; do export $a; done }
autoload -U compinit; compinit
