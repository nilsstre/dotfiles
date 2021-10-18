function docker-reset
    if not test -z (string join '' (docker ps -q))
        echo Stoping all running Docker containers
        docker kill (docker ps -q)
    end
    
    if test -z (string join '' (docker ps -a -q))
        echo No Docker containers to delete
    else 
        docker rm -f (docker ps -a -q)
    end

    if test -z (string join '' (docker images -a -q))
        echo No Docker images to delete
    else
        docker rmi -f (docker images -a -q)
    end
end