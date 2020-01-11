if test -z "$EDITOR"
    set -gx EDITOR "nvim"
end

function fish_greeting
    pwd
end

abbr spm 'npm --userconfig ~/.spmrc'
abbr spx 'npx --userconfig ~/.spmrc'
abbr tcp 'tmux save-buffer - | pbcopy'
abbr e 'emacsclient -t'
abbr ec 'emacsclient -c'
abbr vim 'nvim'
abbr vi 'nvim'
abbr tree 'tree -I node_modules'

### Fisher is behaving badly and is getting a time out
# Fisher plugin manager for fish shell
# if not functions -q fisher
#     set -q XDG_CONFIG_HOME
#     or set XDG_CONFIG_HOME ~/.config
#     curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
#     fish -c fisher
# end

### Time to try Fundle. Eww...
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-ssh-agent'
fundle plugin 'jorgebucaran/fish-nvm'
fundle init

# If we have linuxbrew installed, add to path
if test -d "/home/linuxbrew"
    set PATH /home/linuxbrew/.linuxbrew/bin $PATH
end

# If we have nvm installed, add to path
if test -e '$HOME/.config/fish/functions/nvm.fish'
    source ~/.config/fish/functions/nvm.fish
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

# Run yarn or npm depending on what the project already uses
function p
    if test -e ./package-lock.json
        npm $argv
    else if test -e ./yarn.lock
        yarn $argv
    else
        echo "You haven't used either npm or yarn in this project yet, or this isn't a node directory"
    end
end

# if setxkbmap, swap caps and esc
if test \("Darwin" != (uname -a | cut -d' ' -f1)\) -a \( -f setxkbmap \)
    setxkbmap -option caps:swapescape
end

# Function for editing the current command in $EDITOR
function edit_cmd --description 'Input command in external editor'
    set -l f (mktemp /tmp/fish.cmd.XXXXXXXX)
    if test -n "$f"
        set -l p (commandline -C)
        commandline -b > $f
        eval "$EDITOR -c 'set ft=fish' $f"
        commandline -r (more $f)
        commandline -C $p
        command rm $f
    end
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

nvm use default

if test -f /usr/libexec/java_home
    set JAVA_VERSION "1.8"
    set JAVA_HOME (/usr/libexec/java_home -v $JAVA_VERSION)
    set JAVACMD "$JAVA_HOME/bin/java"
end

set -x GPG_TTY (tty)