function man
  command man -P \"sh -c 'col -b | vim -c \"set ft=man nomod nolist\" -'\" $argv
end