# Variables pulled in from ../main.tf | ../variables.tf:
########################################################
variable "ec2_region"          {}
variable "vpc_id"              {}
variable "subnet_id"           {}
variable "tzg_web_acl"         {}
variable "ssh_key_pair"        {}
variable "ssh_key_path"        {}
variable "ssh_key_name"        {}
variable "ssh_key_user"        {}
variable "ssh_sec_key"         {}
variable "tzg_vpc_cidr"        {}
variable "tzg_subnet"          {}
variable "instance_tenancy"    {}
variable "instance_type"       {}
variable "web_instance_count"  {}
variable "web_install_pkgs"    {}
variable "private_ip"          {}
variable "volume_size"         {}
variable "volume_type"         {}
variable "ansible_playbook"    {}
variable "www_ansible_role"    {}
variable "ansible_sleep_delay" {}


# Official CentOS AMI:
######################
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

