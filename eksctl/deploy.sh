set -e

OPERATION=$1

eksctl $OPERATION cluster -f cluster.yaml