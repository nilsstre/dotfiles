function docker-container-delete
  set containers (string join '' (docker ps -a -q))
  if test -z $containers
    echo No Docker containers to delete
  else 
    docker rm -f containers
  end
end