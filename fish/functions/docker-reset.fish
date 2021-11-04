function docker-reset --description 'Resets Docker'
    docker-stop
    
    docker-container-delete

    docker-image-delete
end