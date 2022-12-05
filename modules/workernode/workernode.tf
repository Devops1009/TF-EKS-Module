resource "aws_eks_node_group" "workernode" {
  cluster_name    = var.cluster_name
  node_group_name = var.nodegrp_name
  node_role_arn   = var.role_arn
  subnet_ids      = [var.sub1 , var.sub2]
  ami_type = var.ami_type
  capacity_type = var.capacity_type
  instance_types  = [ var.instance_types ]

  scaling_config {
    desired_size = var.dsize
    max_size     = var.max
    min_size     = var.min
  }

  update_config {
    max_unavailable = var.maxunavail
  }
}
