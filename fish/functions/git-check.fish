function git-check --argument errorMessage
    if not test (fish_git_prompt)
        if not test -z $errorMessage
            echo $errorMessage >&2
        end
        
        return 1
    else
        return 0
    end
end