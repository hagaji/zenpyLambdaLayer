#!/bin/bash -x

set -e

docker build -t zenpy-lambda-layer ./zenpy
CONTAINER=$(docker run -d zenpy-lambda-layer false)
docker cp $CONTAINER:/opt layer
docker rm $CONTAINER

cd layer
zip -r ../layer.zip .