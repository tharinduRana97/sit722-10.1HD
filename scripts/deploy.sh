
set -u # or set -o nounset
: "$CONTAINER_REGISTRY"
: "$NAME"
: "$VERSION"

envsubst < ./scripts/${NAME}.yaml | kubectl apply -f -