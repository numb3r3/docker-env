#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

USAGE="Usage: `basename $0` [--image IMAGENAME]"

# Parse args to determine which image to build
IMAGE_NAME=${IMAGE_NAME:=base}

while [[ $# > 0 ]]
do
key="$1"
case $key in
    --image)
    IMAGE_NAME="$2"
    shift # past argument
    ;;
    *) # unknown option
    ;;
esac
shift # past argument or value
done

# Setup environment
source "$DIR/env.sh"

if [[ "$IMAGE_NAME" == opencv ]]; then
    CONFIG=opencv-notebook.yml
    NAME=opencv-notebook
elif [[ "$IMAGE_NAME" == base-ocr ]]; then
	CONFIG=base-ocr-notebook.yml
	NAME=base-ocr-notebook
else
  CONFIG=notebook.yml
fi

export PORT=${PORT:=80}

# Create a Docker volume to store notebooks
docker volume create --name "$WORK_VOLUME"

# Bring up a notebook container, using container name as project name
echo "Bringing up notebook '$NAME'"
docker-compose -f "$DIR/$CONFIG" -p "$NAME" up -d

#IP=$(docker-machine ip $(docker-machine active))
#echo "Notebook $NAME listening on $IP:$PORT"