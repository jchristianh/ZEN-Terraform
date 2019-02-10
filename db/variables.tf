variable "ec2_region" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "tzg_db_acl" {}
variable "ssh_key_pair" {}

variable "tzg_vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "tzg_subnet" {
  default = "10.1.2.0/24"
}

variable "instance_tenancy" {
  default = "default"
}

locals {
  ssh_user_name = "centos"
  ssh_key_name  = "tzg"
  ssh_key_path  = "./ssh_keys"
  ssh_pub_key   = "${file("${local.ssh_key_path}/${local.ssh_key_name}.pub")}"
  ssh_sec_key   = "${file("${local.ssh_key_path}/${local.ssh_key_name}.pri")}"
}

variable "instance_type" {
  default = "t2.micro"
}

# Official CentOS
data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-alias"
    values = ["aws-marketplace"]
  }

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }
}

variable "instance_count" {
  default = 3
}

variable "ports" {
  default {
    "redis_port"  = 6379
    "redis_proto" = "tcp"
    "web_port"    = 8000
    "web_proto"   = "tcp"
  }
}


variable "install_pkgs" {
  default = "epel-release perl ansible git mariadb-server"
}
