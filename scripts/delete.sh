
set -u # or set -o nounset
: "$NAME"

envsubst < ./scripts/${NAME}.yaml | kubectl delete -f -