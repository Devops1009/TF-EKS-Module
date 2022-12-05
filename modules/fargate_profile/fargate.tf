resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name           = var.eks_cluster
  fargate_profile_name   = var.fargate_name
  pod_execution_role_arn = var.podrole_arn
  subnet_ids             = [var.sub1 , var.sub2 ]

  selector {
    namespace = "default"
  }

  selector {
    namespace = "kube-system"
  }

  selector {
    namespace = "cert-manager"
  }

  tags = {
    map-migrated = "d-server-028bqm2pgp95c2"
  }

}
