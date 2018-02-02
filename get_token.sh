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

if [[ "$IMAGE_NAME" == opencv ]]; then
    NAME=opencv-notebook
else
	NAME=base-notebook
fi


docker exec -it "$NAME" jupyter notebook list