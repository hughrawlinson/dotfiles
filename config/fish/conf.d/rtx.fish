if type -fq rtx
    rtx activate fish | source

    # Here we manually reference zoxide because for some reason at this point
    # zoxide is not accessible to the shell.

    set real_zoxide (rtx where rust)/bin/zoxide

    if type -fq $real_zoxide
        $real_zoxide init fish | source
    else
        echo 'Failed to load zoxide, run `zoxide init fish | source`'
    end
end
