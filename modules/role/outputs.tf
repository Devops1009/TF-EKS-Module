output "eksrolearn" {
  value = aws_iam_role.eks_role.arn
}

output "fargaterolearn" {
  value = aws_iam_role.fargate_role.arn
}

output "workerrolearn" {
  value = aws_iam_role.workernode_role.arn
}
