function git-reset-origin --argument branch
  git-check

  if not test $status -eq 0
    echo "The git-reset-master command can only be run in a git repository"
    return 1
  end

  if test -z $branch
    set branch "master"
  end

  echo "Are you sure you want to checkout the $branch branch and reset it to origin/$branch? All changes will be lost!"

  if read_confirm
    git fetch
    git checkout -B master origin/$branch
  end
end