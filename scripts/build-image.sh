set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$VERSION"
: "$NAME"
: "$DIRECTORY"

# Construct the full repository URL by appending the microservice name to the base registry URL
FULL_REPOSITORY_URL="$CONTAINER_REGISTRY-$NAME"

# Construct the full image tag with the repository URL and version
FULL_IMAGE_TAG="$FULL_REPOSITORY_URL:$VERSION"

# Build and tag the Docker image directly with the full image tag
docker build -t $FULL_IMAGE_TAG --file ./$DIRECTORY/Dockerfile ./$DIRECTORY

# Output the full image tag for reference or use in other scripts
echo "Image built and tagged as: $FULL_IMAGE_TAG"
