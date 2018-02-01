#!/bin/bash

# Set reasonable default VM settings
: ${VIRTUALBOX_CPUS:=4}
export VIRTUALBOX_CPUS
: ${VIRTUALBOX_MEMORY_SIZE:=4096}
export VIRTUALBOX_MEMORY_SIZE

docker-machine create --driver virtualbox "$@"