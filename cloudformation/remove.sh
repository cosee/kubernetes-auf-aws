set -e

STAGE=staging

aws cloudformation delete-stack --stack-name "$STAGE-eks-nodes"
aws cloudformation wait stack-delete-complete --stack-name "$STAGE-eks-nodes"

aws cloudformation delete-stack --stack-name "$STAGE-eks-master"
aws cloudformation wait stack-delete-complete --stack-name "$STAGE-eks-master"