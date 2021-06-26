# If we have pyenv installed, add to path for python dev
if test -d "$HOME/.pyenv"
  if status is-interactive
    pyenv init --path | source
    pyenv init - | source
  end
end
