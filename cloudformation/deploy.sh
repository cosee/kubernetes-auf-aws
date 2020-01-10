set -e

STAGE=staging
VERSION=1.14
CLUSTERNAME=$STAGE-cluster

# takes first vpc (should be default vpc)
vpcId=$(aws ec2 describe-vpcs | jq -r ".Vpcs[0].VpcId")

# order of subnets is reverse
subnetA=$(aws ec2 describe-subnets --filters Name=vpc-id,Values=${vpcId} | jq -r '.Subnets[2].SubnetId')
subnetB=$(aws ec2 describe-subnets --filters Name=vpc-id,Values=${vpcId} | jq -r '.Subnets[1].SubnetId')
subnetC=$(aws ec2 describe-subnets --filters Name=vpc-id,Values=${vpcId} | jq -r '.Subnets[0].SubnetId')

echo VPC: $vpcId Subnets: $subnetA - $subnetB - $subnetC

aws cloudformation deploy --template-file eks.yaml --stack-name "$STAGE-eks-master" \
--parameter-override "Stage=$STAGE" "Version=$VERSION" "ClusterName=$CLUSTERNAME" "VpcId=$vpcId" "SubnetA=$subnetA" "SubnetB=$subnetB" "SubnetC=$subnetC" \
--capabilities "CAPABILITY_NAMED_IAM"

aws cloudformation deploy --template-file nodegroup.yaml --stack-name "$STAGE-eks-nodes" \
--parameter-override "Stage=$STAGE" "SubnetA=$subnetA" "SubnetB=$subnetB" "SubnetC=$subnetC" --capabilities "CAPABILITY_IAM"