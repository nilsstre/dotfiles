function vim
    if test -q $nvim
      nvim $argv
    else
      command vim $argv
  end
end