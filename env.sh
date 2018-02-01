#!/bin/bash

# Set default values for environment variables required by notebook compose
# configuration file.

# Container name
: "${NAME:=base-notebook}"
export NAME

# Exposed container port
: ${PORT:=80}
export PORT

# Container work volume name
: "${WORK_VOLUME:=$NAME-workspace}"
export WORK_VOLUME

# Container secrets volume name
: "${SECRETS_VOLUME:=$NAME-secrets}"
export SECRETS_VOLUME