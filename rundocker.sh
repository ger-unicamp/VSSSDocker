#!/bin/bash

DOCKER_IMAGE=ger-vsss
CONTAINER_NAME=$DOCKER_IMAGE-container

TEAM_YELLOW=false

VISION_IP=224.0.0.1
MULTICAST_IP=224.5.23.2
COMMAND_IP=127.0.0.1

COMMAND_PORT=20011
VISION_PORT=10002
REFEREE_PORT=10003
REPLACER_PORT=10004


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
        $DOCKER_IMAGE \
        ./vss.exe --vision_ip $VISION_IP --multicast_ip $MULTICAST_IP --command_ip $COMMAND_IP \
                  --referee_port $REFEREE_PORT --replacer_port $REPLACER_PORT \
                  --command_port $COMMAND_PORT -v $VISION_PORT -t $TEAM_YELLOW
