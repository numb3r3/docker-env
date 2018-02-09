#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

USAGE="Usage: `basename $0` [--image IMAGENAME]"

# Setup environment
source "$DIR/env.sh"

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

if [[ "$IMAGE_NAME" == opencv ]]; then
    CONFIG=opencv-notebook.yml
    NAME=opencv-notebook
elif [[ "$IMAGE_NAME" == base-ocr ]]; then
	CONFIG=base-ocr-notebook.yml
	NAME=base-ocr-notebook
else
  CONFIG=notebook.yml
fi



# Build the notebook image
docker-compose -f "$DIR/$CONFIG" build