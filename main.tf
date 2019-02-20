module "tzg_vpc" {
  source           = "modules/vpc"
  ec2_region       = "${var.ec2_region}"
  tzg_vpc_cidr     = "${var.tzg_vpc_cidr}"
  tzg_subnet       = "${var.tzg_subnet}"
  instance_tenancy = "${var.instance_tenancy}"
}

module "tzg_acls" {
  source     = "modules/acl"
  ec2_region = "${var.ec2_region}"
  vpc_id     = "${module.tzg_vpc.tzg_vpc_id}"
}

module "tzg_ssh_keys" {
  source     = "modules/keys"
  ec2_region = "${var.ec2_region}"
}

module "tzg_www" {
  source             = "modules/www"
  ec2_region         = "${var.ec2_region}"
  vpc_id             = "${module.tzg_vpc.tzg_vpc_id}"
  subnet_id          = "${module.tzg_vpc.tzg_subnet_id}"
  tzg_web_acl        = "${module.tzg_acls.web_acl}"
  ssh_key_pair       = "${module.tzg_ssh_keys.ssh_key_pair}"
  ssh_key_path       = "${module.tzg_ssh_keys.ssh_key_path}"
  ssh_key_name       = "${module.tzg_ssh_keys.ssh_key_name}"
  ssh_key_user       = "${module.tzg_ssh_keys.ssh_key_user}"
  ssh_sec_key        = "${module.tzg_ssh_keys.ssh_sec_key}"
  tzg_vpc_cidr       = "${var.tzg_vpc_cidr}"
  tzg_subnet         = "${var.tzg_subnet}"
  instance_tenancy   = "${var.instance_tenancy}"
  instance_type      = "${var.instance_type}"
  web_instance_count = "${var.web_instance_count}"
  web_install_pkgs   = "${var.web_install_pkgs}"
  private_ip         = "${var.web_pri_ip}"
  volume_size        = "${var.volume_size}"
  volume_type        = "${var.volume_type}"
  ansible_playbook   = "${var.ansible_playbook}"
}


module "tzg_db" {
  source            = "modules/db"
  ec2_region        = "${var.ec2_region}"
  vpc_id            = "${module.tzg_vpc.tzg_vpc_id}"
  subnet_id         = "${module.tzg_vpc.tzg_subnet_id}"
  tzg_db_acl        = "${module.tzg_acls.db_acl}"
  ssh_key_pair      = "${module.tzg_ssh_keys.ssh_key_pair}"
  ssh_key_path      = "${module.tzg_ssh_keys.ssh_key_path}"
  ssh_key_name      = "${module.tzg_ssh_keys.ssh_key_name}"
  ssh_key_user      = "${module.tzg_ssh_keys.ssh_key_user}"
  ssh_sec_key       = "${module.tzg_ssh_keys.ssh_sec_key}"
  tzg_vpc_cidr      = "${var.tzg_vpc_cidr}"
  tzg_subnet        = "${var.tzg_subnet}"
  instance_tenancy  = "${var.instance_tenancy}"
  instance_type     = "${var.instance_type}"
  db_instance_count = "${var.db_instance_count}"
  db_install_pkgs   = "${var.db_install_pkgs}"
  private_ip        = "${var.db_pri_ip}"
  volume_size       = "${var.volume_size}"
  volume_type       = "${var.volume_type}"
  ansible_playbook  = "${var.ansible_playbook}"
}
