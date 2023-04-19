#!/bin/bash

## Deployment parameters
# Geoserver
# See https://docs.geoserver.org/latest/en/user/installation/docker.html
VERSION=2.23.0
EXTENSIONS="ysld,importer"
HOST_DATADIR="/root/geoserver/geoserver_data" # Bind host dir to container data dir
CORS_ENABLED=1
# Docker
PORT=80

# Use own data directory
if [ -n "$HOST_DATADIR" ]; then
    ARGS_MOUNT="--mount type=bind,src=$HOST_DATADIR,target=/opt/geoserver_data"
fi

# Adding geoserver extensions
if [ -n "$EXTENSIONS" ]; then
    ARGS_ENV="$ARGS_ENV --env INSTALL_EXTENSIONS=true"
    ARGS_ENV="$ARGS_ENV --env STABLE_EXTENSIONS=$EXTENSIONS"
fi

# Configure CORS
# TODO: Allow to modify allowed origins, methods and headers
if [ $CORS_ENABLED -ne 0 ]; then
    ARGS_ENV="$ARGS_ENV --env CORS_ENABLED=true"
    ARGS_ENV="$ARGS_ENV --env CORS_ALLOWED_ORIGINS=*"
    ARGS_ENV="$ARGS_ENV --env CORS_ALLOWED_METHODS=GET,POST,PUT,DELETE,HEAD,OPTIONS"
    ARGS_ENV="$ARGS_ENV --env CORS_ALLOWED_HEADERS=*"
fi

echo docker run $ARGS_MOUNT -it -p$PORT:8080 $ARGS_ENV docker.osgeo.org/geoserver:$VERSION
