variable "cluster_name" {
  description = " cluster name"
  type = string
}

variable "nodegrp_name" {
  description = " nodegrp name"
  type = string
}

variable "role_arn" {
  description = " worker role arn"
  type = string
}

variable "sub1" {
  description = "vpc subnet"
  type        = string
}

variable "sub2" {
  description = "vpc subnet 2"
  type        = string
}

variable "ami_type" {
  description = "ami type"
  type        = string
}

variable "capacity_type" {
  description = "capacity type"
  type        = string
}

variable "instance_types" {
  description = "instance  type"
  type        = string
}

variable "dsize" {
  description = "instance desired_size"
  type        = string
}

variable "max" {
  description = "maximum instance "
  type        = string
}

variable "min" {
  description = "minimum instance "
  type        = string
}

variable "maxunavail" {
  description = "max unavailable instance"
  type        = string
}
