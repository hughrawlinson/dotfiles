# Run yarn or npm depending on what the project already uses
function p
    if test -e ./package-lock.json
        npm $argv
    else if test -e ./yarn.lock
        if test ($argv[1] = "i") -o ($argv[1] = "install")
            if test -n $argv[2]
                yarn $argv[2..100000000]
            else
                yarn
            end
        end
    else
        echo "You haven't used either npm or yarn in this project yet, or this isn't a node directory"
    end
end
