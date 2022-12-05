resource "aws_iam_role" "eks_role" {
  name = var.cluster_role
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" , "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "eks.amazonaws.com",
            "eks-fargate-pods.amazonaws.com"
            ]
        }
      },
    ]
  })

  tags = {
    Env = "Dev"
  }
}

resource "aws_iam_role" "fargate_role" {
  name = var.fargate_role
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy" , "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy" , "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "eks.amazonaws.com",
            "eks-fargate-pods.amazonaws.com"
            ]
        }
      },
    ]
  })

  tags = {
    Env = "Dev"
  }
}

resource "aws_iam_role" "workernode_role" {
  name = var.worker_role
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy" , "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly" , "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "ec2.amazonaws.com"
            ]
        }
      },
    ]
  })

  tags = {
    Env = "Dev"
  }
}
