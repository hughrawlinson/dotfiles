if test -z "$EDITOR"
    set -gx EDITOR "nvim"
end

function fish_greeting
end

abbr spm 'npm --userconfig ~/.spmrc'
abbr spx 'npx --userconfig ~/.spmrc'
abbr tcp 'tmux save-buffer - | pbcopy'
abbr e 'emacsclient -t'
abbr ec 'emacsclient -c'
abbr vim 'nvim'
abbr vi 'nvim'
abbr tree 'tree -I node_modules'
abbr lah 'ls -lah'
abbr glo 'git log --oneline'

if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-ssh-agent'
fundle plugin 'brigand/fast-nvm-fish'
fundle init

nvm use default

# If we have linuxbrew installed, add to path
if test -d "/home/linuxbrew"
    set PATH /home/linuxbrew/.linuxbrew/bin $PATH
end

# If we have Google Cloud SDK installed on Mac, source
if test -d '/Users/hugh/google-cloud-sdk'
    bass source '/Users/hugh/google-cloud-sdk/path.bash.inc'
    bass source '/Users/hugh/google-cloud-sdk/completion.bash.inc'
end

if type -fq rbenv
    status --is-interactive
    and source (rbenv init -|psub)
end

# If we have cargo installed, add to path for some rust dev
if test -d "$HOME/.cargo/bin"
    set -g PATH $HOME/.cargo/bin $PATH
end

# if type -f go;
#     set -g PATH (go env GOPATH);
# end;

# If we have pyenv installed, add to path for python dev
if test -d "$HOME/.pyenv"
    set PYENV_ROOT "$HOME/.pyenv"
    set PATH "$PYENV_ROOT/bin" $PATH
    # https://github.com/pyenv/pyenv/issues/688
    set -g -x GIT_INTERNAL_GETTEXT_TEST_FALLBACKS 1
    if status --is-interactive
        source (pyenv init -|psub)
        source (pyenv virtualenv-init -|psub)
    end
    eval (python -m virtualfish)
end

# Required for GPG signing
set -gx GPG_TTY (tty)

# Mac specific setup
if test \("Darwin" != (uname -a | cut -d' ' -f1)\) -a \( -f setxkbmap \)
  setxkbmap -option caps:swapescape
else
  # let me repeat my keys!!!
  defaults write -g ApplePressAndHoldEnabled -bool false
end

if status --is-interactive
    # Keybinding for editing the current command in $EDITOR
    bind -k f4 edit_cmd; commandline -f execute

    # Keybinding to refresh fish config
    bind -k f5 eval "source $HOME/.config/fish/config.fish"
end

# Make sure to have user scripts in path
if not contains "$HOME/.local/bin" $PATH
    set PATH "$HOME/.local/bin" $PATH
end

if test -f /usr/libexec/java_home
    set JAVA_VERSION "1.8"
    set JAVA_HOME (/usr/libexec/java_home -v $JAVA_VERSION)
    set JAVACMD "$JAVA_HOME/bin/java"

    set PATH $HOME/.jenv/bin $PATH
    status --is-interactive; and source (jenv init -|psub)
end

set -x GPG_TTY (tty)
set PATH "/usr/local/sbin" $PATH

