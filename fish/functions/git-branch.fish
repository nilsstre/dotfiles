function git-branch
    git-check "Must be in a git repository"

    if not test $status -eq 0
        return 1
    end

    git fetch
    git checkout (git branch | fzf | tr -d ‘[:space:]’)
end