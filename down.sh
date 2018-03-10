#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

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
    *) # unknown option
    ;;
esac

# Bring down the notebook container, using container name as project name
docker-compose -f "$DIR/$CONFIG" -p "$NAME" down