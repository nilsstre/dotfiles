#!/usr/bin/env zsh


git-local-clean () {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch_name="(unnamed branch)"     # detached HEAD
  branch_name=${branch_name##refs/heads/}

  echo "branch name: $branch_name"

  LOCAL_BRANCHES=$(git for-each-ref --format '%(refname:short)' --merged HEAD refs/heads/ | grep -v "master" | grep -v "main")

  if [[ "$1" == "all"  ]]; then
    echo "Local branches:"
    echo "$LOCAL_BRANCHES"

    read "yn?Do you want to delete all local branches? (y/n) "

    case $yn in 
      [yY] );;
      * ) echo "Skipping";
        exit 0;;
    esac

    for mergedBranch in $LOCAL_BRANCHES
    do
      echo $mergedBranch
    done
  else
    for mergedBranch in $LOCAL_BRANCHES
    do
      read "yn?Do you want to delete the $mergedBranch branch? (y/n) "

      case "$yn" in
        [yY]) echo "Deleting branch: $mergedBranch";;
        *) echo "Skip deleting branch $mergedBranch";;
      esac
    done
  fi
}
