function fish_user_key_bindings
    if test (type -t fzf_key_bindings) = "function"
        fzf_key_bindings
    end
end
