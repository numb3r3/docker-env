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
    base-ocr-notebook)
		CONFIG=base-ocr-notebook.yml
	;;
    *) # unknown option
    ;;
esac


docker-compose -f "$DIR/$CONFIG" -p "$NAME" ps