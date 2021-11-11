function git-reset-file --argument file branch --description "Resest a specific file (first argument) to a branch (second argument, defual=origin/master)"
    git-check "Must be in a git repository"

    if not test $status -eq 0
        return 1
    end
    
    if test -z $file
        echo Must specify which file to reset
        return 1
    end

    if not test -f $file
        echo "Can't find the file" $file
        return 1
    end

    if test -z $branch
        set branch "origin/master"
    end

    echo "Are you sure you want reset the file" $file "to branch" $branch"?"

    if read_confirm
        git checkout $branch $file
    end
end