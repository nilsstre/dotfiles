function delete-branches
    git status &> /dev/null

    if test $status -eq 0
        set branches (git branch | grep -v \*)

        echo Deleting the following branches: (echo $branches | xargs)

        if read_confirm
            echo $branches | xargs git branch -D
        end
    else
        echo Current directory is not a git repository
    end
end

function read_confirm
    while true
      read -l -P 'Do you want to continue? [y/N] ' confirm
  
      switch $confirm
        case Y y
          return 0
        case '' N n
          return 1
      end
    end
  end