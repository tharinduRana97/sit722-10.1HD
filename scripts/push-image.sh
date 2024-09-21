#!/bin/bash

# Ensure required variables are set
set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$NAME"

# Construct the full repository URL by appending the microservice name to the base registry URL
FULL_REPOSITORY_URL="$CONTAINER_REGISTRY-$NAME"

# Construct the full image tag with the repository URL and version
FULL_IMAGE_TAG="$FULL_REPOSITORY_URL:$VERSION"

# Log in to Amazon ECR
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $CONTAINER_REGISTRY

# Tag the Docker image with the appropriate full image tag for ECR
# Assuming the image is already built locally with a local tag, e.g., NAME:VERSION
docker tag $NAME:$VERSION $FULL_IMAGE_TAG

# Push the Docker image to the ECR repository
docker push $FULL_IMAGE_TAG

# Output the full image tag for reference
echo "Image tagged and pushed to: $FULL_IMAGE_TAG"