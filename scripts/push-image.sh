#!/bin/bash

# Ensure required variables are set
set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$NAME"

# Log in to Amazon ECR
# This uses AWS CLI to get the login password and log into the Docker registry
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $CONTAINER_REGISTRY

# Tag the Docker image
docker tag $NAME:$VERSION $CONTAINER_REGISTRY/$NAME:$VERSION

# Push the Docker image to the repository
docker push $CONTAINER_REGISTRY/$NAME:$VERSION
