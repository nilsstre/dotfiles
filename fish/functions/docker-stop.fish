function docker-stop
  if test -z (string join '' (docker ps -q))
    echo No running Docker containers
  else
    docker kill (docker ps -q)
  end
end