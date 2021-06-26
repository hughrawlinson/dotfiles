# If we have cargo installed, add to path for some rust dev
if test -d "$HOME/.cargo/bin"
    fish_add_path $HOME/.cargo/bin
end
