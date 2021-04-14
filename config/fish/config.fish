if test -z "$EDITOR"
    set -gx EDITOR "nvim"
end

function reverse_history_search
  history | fzf --no-sort | read -l command
  if test $command
    commandline -rb $command
  end
end

function fish_user_key_bindings
  bind \cr reverse_history_search
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

  nvm use default >> /dev/null

# If we have linuxbrew installed, add to path
if test -d "/home/linuxbrew"
    fish_add_path /home/linuxbrew/.linuxbrew/bin
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
    fish_add_path $HOME/.cargo/bin
end

# if type -f go;
#     set -g PATH (go env GOPATH);
# end;

# If we have pyenv installed, add to path for python dev
if test -d "$HOME/.pyenv"
  set PYENV_ROOT "$HOME/.pyenv"
  fish_add_path "$PYENV_ROOT/bin"
  # https://github.com/pyenv/pyenv/issues/688
  set -g -x GIT_INTERNAL_GETTEXT_TEST_FALLBACKS 1
  if status --is-interactive
      source (pyenv init -|psub)
      source (pyenv virtualenv-init -|psub)
  end
end


# If we have rbenv installed, add to path for ruby dev
if test -d "$HOME/.rbenv"
  set RBENV_ROOT "$HOME/.rbenv"
  fish_add_path "$RBENV_ROOT/bin"
  if status --is-interactive
      source (rbenv init -|psub)
  end
end

# If we have goenv installed, add to path for gothon dev
if test -d "$HOME/.goenv"
  set GOENV_ROOT "$HOME/.goenv"
  fish_add_path "$GOENV_ROOT/bin"
  if status --is-interactive
      source (goenv init -|psub)
  end
end

if status --is-interactive
  bind -k f4 edit_cmd; commandline -f execute
  # if setxkbmap, swap caps and esc
  if test "Darwin" != (uname -a | cut -d' ' -f1)
  #     if type -q setxkbmap
  #         setxkbmap -option caps:swapescape
  #     end
  else
    defaults write -g ApplePressAndHoldEnabled -bool false
  end
  # Keybinding to refresh fish config
  bind -k f5 eval "source $HOME/.config/fish/config.fish"
end

# Make sure to have user scripts in path
fish_add_path "$HOME/.local/bin"

if test -f /usr/libexec/java_home
    set JAVA_VERSION "1.8"
    set JAVA_HOME (/usr/libexec/java_home -v $JAVA_VERSION)
    set JAVACMD "$JAVA_HOME/bin/java"

    fish_add_path $HOME/.jenv/bin
    status --is-interactive; and source (jenv init -|psub)
end

set -gx GPG_TTY (tty)
set DISPLAY "localhost:0"
fish_add_path "/usr/local/sbin"
alias emsdk_setup "source $HOME/emsdk/emsdk_env.fish"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.fish.inc' ]; . '$HOME/google-cloud-sdk/path.fish.inc'; end

alias copy "xclip -selection clipboard"
