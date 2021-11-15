function git-branch
    git-check "Must be in a git repository"

    if not test $status -eq 0
        return 1
    end

    set new_branch "create new branch"

    set selected_branch (string split ';' (string join ';' (string trim (string replace -a '*' '' (git branch)) $new_branch)) | awk NF | fzf)

    if test -z $selected_branch
        echo No branch was selected >&2
        return 1
    end

    if test $selected_branch = $new_branch
        git-create-new-branch

        if test $status -eq 0
            return 0
        else
            return 1
        end
    end

    git fetch
    git checkout $selected_branch
end

function git-create-new-branch
    read -l -P 'New branch name: ' new_branch_name

    if test -z $new_branch_name
        echo Branch name can\'t be an empty string >&2
        return 1
    else 
        git checkout -b $new_branch_name

        read_confirm 'Push the new branch to remote? [y/N] '

        if test $status -eq 0
            git push --set-upstream origin $new_branch_name
        end

        return 0
    end 
end