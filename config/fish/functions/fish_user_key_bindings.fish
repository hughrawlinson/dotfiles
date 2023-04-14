function fish_user_key_bindings
    if test (type -t fzf_key_bindings) = "function"
        fzf_key_bindings
    end

    # Open current command in $EDITOR
    bind -k f4 edit_cmd

    # Reload fish config
    bind -k f5 eval "source $HOME/.config/fish/config.fish"
end
