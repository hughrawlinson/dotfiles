export ZSH=$HOME/.oh-my-zsh

# Oh My ZSH
plugins=(
  brew
  common-aliases
  compleat
  dirpersist
  docker
  git
  git-fast
  git-extras
  last-working-dir
  npm
  nyan
  osx
  pyenv
  python
  ssh-agent
  sudo
  tmux
  tmuxinator
  )
source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
[ -f /Users/hugh/.travis/travis.sh ] && source /Users/hugh/.travis/travis.sh
source ~/.cargo/env
# Using Docker for Mac now, this shouldn't be required.
# if which docker-machine > /dev/null; then eval "$(docker-machine env default)"; fi

alias tmux="tmux -2"
alias spm='npm --registry http://npm-registry.spotify.net --userconfig ~/.spmrc --always-auth=true'
alias ghci="stack ghci"
alias ghc="stack ghc"
alias npm-exec='PATH=$(npm bin):$PATH'
#alias ec="emacsclient --no-wait -c"
#alias e="emacsclient -t"
alias em="emacsclient -t"
alias e="$EDITOR"
alias ds='docker-machine start default && docker-machine env default'

function loadenv() { cat .env | while read a; do export $a; done }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
