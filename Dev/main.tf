provider "aws" {
  region = "us-east-2"
}

module "my_eks_role" {
  source       = "../modules/role"
  cluster_role = "eks-consumerDB_cluster_role"
  fargate_role = "eks-consumerDB_fargate_profile_podrole"
  worker_role  = "eks-consumerDB-workernode_role"
}

module "my_eks_sggrp" {
  source       = "../modules/security_group"
  ekssgrp_name = "eks-consumerDB-sg"
  vpc_id       = "vpc-0c4dd248fee898545"

}

module "my_eks_cluster" {
  source     = "../modules/eks_cluster"
  eks_name   = "dev-eks-consumerDB"
  eks_role   = module.my_eks_role.eksrolearn
  sub1       = "subnet-04bf8bcb9b2e40f27"
  sub2       = "subnet-026e859c93a17e376"
  ipfamily   = "ipv4"
  ekssgrp_id = module.my_eks_sggrp.ekssg_id
}

module "my_fargate_profile" {
  source       = "../modules/fargate_profile"
  eks_cluster  = module.my_eks_cluster.cluster_name
  fargate_name = "consumerDB_fargate_profile"
  podrole_arn  = module.my_eks_role.fargaterolearn
  sub1         = "subnet-04bf8bcb9b2e40f27"
  sub2         = "subnet-026e859c93a17e376"
}


/** # worker node code
module "my_worker_node" {
  source         = "../modules/workernode"
  cluster_name   = module.my_eks_cluster.cluster_name
  nodegrp_name   = "eks-consumerDB-workernode-group"
  role_arn       = module.my_eks_role.workerrolearn
  sub1     = "subnet-04bf8bcb9b2e40f27"
  sub2     = "subnet-026e859c93a17e376"
  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  instance_types = "t2.micro"
  dsize          = "4"
  max            = "4"
  min            = "4"
  maxunavail     = "4"
}
*/
