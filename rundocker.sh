#!/bin/bash

DOCKER_IMAGE=ger-vsss
CONTAINER_NAME=$DOCKER_IMAGE-container

docker run -it --rm \
        --name $CONTAINER_NAME \
        --user=$(id -u) \
        --env="DISPLAY" \
        --env="QT_X11_NO_MITSHM=1" \
        --memory=1024g \
        --oom-kill-disable \
        --ipc="host" \
        --volume="/dev:/dev" \
        --privileged \
        --network=host \
        --volume="/etc/group:/etc/group:ro" \
        --volume="/etc/passwd:/etc/passwd:ro" \
        --volume="/etc/shadow:/etc/shadow:ro" \
        --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
        --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        $DOCKER_IMAGE