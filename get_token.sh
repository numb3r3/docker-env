#!/bin/bash

set -e

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
    chi-ocr-notebook)
        CONFIG=chi-ocr-notebook.yml
    ;;
    tf-notebook)
        CONFIG=tf-notebook.yml
    ;;
    *) # unknown option
    ;;
esac


docker exec -it "$NAME" jupyter notebook list