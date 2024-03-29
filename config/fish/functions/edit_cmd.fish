# Function for editing the current command in $EDITOR
function edit_cmd --description 'Input command in external editor'
    set -l f (mktemp /tmp/fish.cmd.XXXXXXXX)
    if test -n "$f"
        set -l p (commandline -C)
        commandline -b >$f
        eval "$GITEDITOR -c 'set ft=fish' $f"
        commandline -r (more $f)
        commandline -C $p
        command rm $f
    end
end
