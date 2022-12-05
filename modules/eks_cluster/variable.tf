variable "sub1" {
  description = "vpc subnet"
  type        = string
}

variable "sub2" {
  description = "vpc subnet 2"
  type        = string
}

variable "eks_name" {
  description = "eks name"
  type        = string
}

variable "ipfamily" {
  description = "ipfamily"
  type        = string
}

variable "eks_role" {
  description = "eks role arn"
  type        = string
}

variable "ekssgrp_id" {
  description = "eks sggrp id"
  type        = string
}
