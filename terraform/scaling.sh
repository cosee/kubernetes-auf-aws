terraform apply -var 'desired_nodes=2' -auto-approve
watch kubectl  get nodes