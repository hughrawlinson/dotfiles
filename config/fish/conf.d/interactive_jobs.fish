# 1. The core function
function fzf-jobs
    # Capture the raw job line
    set -l target (jobs | fzf --height 20% --layout=reverse --border --prompt="Bring to foreground: ")

    if test -n "$target"
        # Extract the very first sequence of digits on the line, ignoring leading whitespace
        set -l job_id (string match -r '[0-9]+' (string trim $target))[1]

        # Double-check that we actually grabbed a valid number
        if string match -qr '^[0-9]+$' "$job_id"
            # Queue up the command line and execute it in the clean interactive context
            commandline -r "fg %$job_id"
            commandline -f execute
        else
            echo "Error: Could not parse job ID from line: $target"
        end
    else
        commandline -f repaint
    end
end

# 2. Apply the bindings directly if the shell is interactive
if status is-interactive
    # Standard / Emacs mode
    bind \cz fzf-jobs

    # Vi insert mode
    bind -M insert \cz fzf-jobs
end
