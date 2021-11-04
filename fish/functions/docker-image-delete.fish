function docker-image-delete
  set images (docker images -a -q)
  
  if test -z (string join '' $images)
    echo No Docker images to delete
  else
      docker rmi -f $images
  end
end