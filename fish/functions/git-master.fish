function master
    git-check "Must be in a git repository"

    if not test $status -eq 0
        return 1
    end

    git checkout master && git pull
end