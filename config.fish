bass source ~/.nvm/nvm.sh
source ~/.config/fish/functions/nvm.fish
set PATH $PATH $HOME/.local/bin

if test -d '/Users/hugh/google-cloud-sdk'
  bass source '/Users/hugh/google-cloud-sdk/path.bash.inc'
  bass source '/Users/hugh/google-cloud-sdk/completion.bash.inc'
end

alias spm='npm --userconfig ~/.spmrc'
alias tcp='tmux save-buffer - | pbcopy'

alias e='emacsclient -t'
alias ec='emacsclient -c'
alias vim='emacsclient -t'
alias vi='emacsclient -t'

export PATH="$HOME/.cargo/bin:$PATH"

