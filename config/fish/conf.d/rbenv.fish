# If we have rbenv installed, add to path for ruby dev
if test -d "$HOME/.rbenv"
  set RBENV_ROOT "$HOME/.rbenv"
  fish_add_path "$RBENV_ROOT/bin"
  if status --is-interactive
      source (rbenv init -|psub)
  end
end