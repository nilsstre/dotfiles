function port-kill --argument port
  if test -z $port
    return 1
  end

  set process (sudo lsof -t -i:$port)

  echo killing process with id $process
  sudo kill $process
end