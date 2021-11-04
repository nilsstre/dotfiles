function delete-remote --argument branch
    git-check  "Must be in a git repository"

    if not test $status -eq 0
        return 1
    end

    if test -z $branch
        echo "No branch name was provided"
        return 1
    else
        echo Deleting branch $branch

        if read_confirm
            git push origin --delete $branch
        end
    end
end
