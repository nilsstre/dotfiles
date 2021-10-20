function file-reset
    if not test -f $argv
        echo "Can't find the file" $argv
        return 1
    end

    echo "Are you sure you want reset the file" $argv "to origin/master?"

    if read_confirm
        git checkout origin/master $argv
    end
end