function git-delete-branches
    git-check "Must be in a git repository"

    if not test $status -eq 0
        return 1
    end

    set branches (git branch | grep -v \*)

    echo Deleting the following branches: (echo $branches | xargs)

    if read_confirm 
        echo $branches | xargs git branch -D
        echo $branches | xargs git-delete-remote
    end
end
