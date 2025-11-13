if test -z "$EDITOR"
    if type -fq nvim
        set -gx EDITOR nvim
    else
        set -gx EDITOR nano
    end
end

if test -z "$GIT_EDITOR"
    if type -fq nvim
        set -gx EDITOR nvim
    else
        set -gx EDITOR nano
    end
end
