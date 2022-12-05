variable "sub1" {
  description = "vpc subnet"
  type        = string
}

variable "sub2" {
  description = "vpc subnet 2"
  type        = string
}
variable "eks_cluster" {
  description = "eks cluster name"
  type        = string
}

variable "fargate_name" {
  description = "fargate profile name"
  type        = string
}

variable "podrole_arn" {
  description = "fargate pod role arn"
  type        = string
}
