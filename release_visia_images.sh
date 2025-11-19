#!/bin/bash

export CVAT_VERSION=latest
export CLAM_AV=yes
export DOCKER_DEFAULT_PLATFORM=linux/amd64

docker compose -f docker-compose.yml -f docker-compose.dev.yml build

export GIT_HASH=$(git rev-parse --short HEAD)

export UI_TAG=us-east1-docker.pkg.dev/binit-244703/cvat/ui:$GIT_HASH
docker tag cvat/ui $UI_TAG
docker push $UI_TAG

export SERVER_TAG=us-east1-docker.pkg.dev/binit-244703/cvat/server:$GIT_HASH
docker tag cvat/server $SERVER_TAG
docker push $SERVER_TAG

echo "Pushed $UI_TAG"
echo "Pushed $SERVER_TAG"
