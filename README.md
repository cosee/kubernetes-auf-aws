# Kubernetes auf AWS

Repo contains demo code to deploy EKS with three different tools.

## Cloudformation

To deploy run `deploy.sh`.
This will deploy two stacks, one for the master plane and one for one managed nodegroup.
As VPC the default one is used.

To play demo screencast run: `asciinema play cfn_deploy.cast -i 5`

## eksctl

To deploy run `deploy.sh`. First parameter is the operation whether to create a cluster or update one.
This deploys a EKS Stack with VPC, master plane and a managed nodegroup. See `cluster.yaml` for configuration.

To play demo screencast run: `asciinema play eksctl_deploy.cast -i 5`

## Terraform

To deploy run `deploy.sh`
Deploys a simple VPC and EKS with one managed nodegroup. 
Based on https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/eks-getting-started

To play demo screencast run: `asciinema play terraform_deploy.cast -i 5`
