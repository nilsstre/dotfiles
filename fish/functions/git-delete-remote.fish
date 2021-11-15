function git-delete-remote --argument branch
    git-check  "The git-delete-remote command can only be run in a git repository"

    if not test $status -eq 0
        return 1
    end

    if test -z $branch
        echo "No branch name was provided"
        return 1
    end

    echo Deleting branch $branch

    if read_confirm
        git push origin --delete $branch
    end
end
