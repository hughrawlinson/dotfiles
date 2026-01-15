function fish_user_key_bindings
    # Open current command in $EDITOR
    bind f4 edit_cmd

    # Reload fish config
    bind f5 eval "source $HOME/.config/fish/config.fish"

    bind ctrl-r eval "atuin search"
end
