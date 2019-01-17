source ~/.config/fish/functions/nvm.fish

if test -d '/Users/hugh/google-cloud-sdk'
  bass source '/Users/hugh/google-cloud-sdk/path.bash.inc'
  bass source '/Users/hugh/google-cloud-sdk/completion.bash.inc'
end

alias spm='npm --userconfig ~/.spmrc'
alias spx='npx --userconfig ~/.spmrc'
alias tcp='tmux save-buffer - | pbcopy'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias vim='nvim'
alias vi='nvim'

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
for file in $XDG_CONFIG_HOME/fish/conf.d/*.fish
    builtin source $file 2>/dev/null
end

eval (python -m virtualfish)

# status --is-interactive; and source (rbenv init -|psub)set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths

# status --is-interactive; and . (rbenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)

set PATH $HOME/.cargo/bin $PATH
set GPG_TTY (tty)
