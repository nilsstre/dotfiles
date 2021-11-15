function git-master
    git-check "The git-master command can only be run in a git repository"

    if not test $status -eq 0
        return 1
    end

    git checkout master && git pull
end