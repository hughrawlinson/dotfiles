# If we have goenv installed, add to path for gothon dev
if test -d "$HOME/.goenv"
  set GOENV_ROOT "$HOME/.goenv"
  fish_add_path "$GOENV_ROOT/bin"
  if status --is-interactive
      source (goenv init -|psub)
  end
end
