function git-check --argument errorMessage
    if test (fish_git_prompt)
        return 0
    end

    if not test -z $errorMessage
        echo $errorMessage >&2
    end
    
    return 1
end