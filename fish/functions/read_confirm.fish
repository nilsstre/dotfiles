function read_confirm --argument question
  if test -z $question
    set question 'Do you want to continue? [y/N] '
  end

  while true
    read -l -P $question confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end