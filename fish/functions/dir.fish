function dir --description 'Change to a sub directory using fzf'
    cd (ls -d */ | fzf | tr -d ‘[:space:])
end