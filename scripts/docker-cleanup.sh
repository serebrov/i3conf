#!/bin/bash

docker container prune
docker image prune
docker volume prune
docker network prune

# containers
# docker rm $(docker ps -qa --no-trunc --filter "status=exited")

# images
# docker rmi -f $(docker images -q -a -f dangling=true)

# volumes
# docker volume rm $(docker volume ls -qf dangling=true
