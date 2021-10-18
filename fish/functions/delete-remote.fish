function delete-remote
    echo $argv
    git push origin --delete $argv
end
