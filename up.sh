#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup environment
source "$DIR/env.sh"

# Bring down the notebook container, using container name as project name
CONFIG="notebook.yml"

case $NAME in
    opencv-notebook)
    	CONFIG=opencv-notebook.yml
    ;;
    ocr-notebook)
		CONFIG=ocr-notebook.yml
	;;
    *) # unknown option
    ;;
esac

export PORT=${PORT:=80}

# Create a Docker volume to store notebooks
docker volume create --name "$WORK_VOLUME"

# Bring up a notebook container, using container name as project name
echo "Bringing up notebook '$NAME'"
docker-compose -f "$DIR/$CONFIG" -p "$NAME" up -d

#IP=$(docker-machine ip $(docker-machine active))
#echo "Notebook $NAME listening on $IP:$PORT"