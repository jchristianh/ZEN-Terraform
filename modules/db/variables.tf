variable "ec2_region"          {}
variable "vpc_id"              {}
variable "subnet_id"           {}
variable "tzg_db_acl"          {}
variable "ssh_key_pair"        {}
variable "ssh_key_path"        {}
variable "ssh_key_name"        {}
variable "ssh_key_user"        {}
variable "ssh_sec_key"         {}
variable "tzg_vpc_cidr"        {}
variable "tzg_subnet"          {}
variable "instance_tenancy"    {}
variable "instance_type"       {}
variable "db_instance_count"   {}
variable "db_install_pkgs"     {}
variable "private_ip"          {}
variable "volume_size"         {}
variable "volume_type"         {}
variable "ansible_playbook"    {}
variable "db_ansible_role"     {}
variable "ansible_sleep_delay" {}


locals {
  ssh_user_name = "centos"
  ssh_key_name  = "tzg"
  ssh_key_path  = "./ssh_keys"
  ssh_pub_key   = "${file("${local.ssh_key_path}/${local.ssh_key_name}.pub")}"
  ssh_sec_key   = "${file("${local.ssh_key_path}/${local.ssh_key_name}.pri")}"
}


# Official CentOS
data "aws_ami" "centos" {
  most_recent = true
  owners      = ["aws-marketplace"]

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
