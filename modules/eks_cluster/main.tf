resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_name
  role_arn = var.eks_role


  vpc_config {
    subnet_ids              = [var.sub1, var.sub2]
    endpoint_private_access = false
    endpoint_public_access  = true
    security_group_ids = [ var.ekssgrp_id ]
  }

  kubernetes_network_config {
    ip_family = var.ipfamily
    ##    service_ipv4_cidr = The CIDR block to assign Kubernetes service IP addresses from
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  tags = {
    map-migrated = "d-server-028bqm2pgp95c2"
  }

}
