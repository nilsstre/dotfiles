function git-delete-branch --argument branch_name
  git-check "The git-delete-branch command can only be run in a git repository"

  if not test $status -eq 0
      return 1
  end

  if test -z $branch_name
    echo Branch name can\'t be empty
    return 1
  end

  git branch -d $branch_name
end