variable "ec2_region" {}

locals {
  ssh_key_user = "centos"
  ssh_key_name = "tzg"
  ssh_key_path = "~/.ssh"
  ssh_pub_key  = "${file("${local.ssh_key_path}/${local.ssh_key_name}.pub")}"
  ssh_sec_key  = "${file("${local.ssh_key_path}/${local.ssh_key_name}.pri")}"
}
