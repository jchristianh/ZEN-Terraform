# VPC Vars for The Zen Garden AWS Cloud

variable "tzg_vpc_cidr" {
  default = "10.2.0.0/16"
}

variable "tzg_subnet" {
  default = "10.2.2.0/24"
}

variable "instance_tenancy" {
  default = "default"
}

variable "ec2_region" {}
