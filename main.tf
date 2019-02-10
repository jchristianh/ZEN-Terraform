module "tzg_vpc" {
  source     = "vpc"
  ec2_region = "${var.ec2_region}"
}

module "tzg_acls" {
  source     = "acl"
  ec2_region = "${var.ec2_region}"
  vpc_id     = "${module.tzg_vpc.tzg_vpc_id}"
}

module "tzg_www" {
  source      = "www"
  ec2_region  = "${var.ec2_region}"
  vpc_id      = "${module.tzg_vpc.tzg_vpc_id}"
  subnet_id   = "${module.tzg_vpc.tzg_subnet_id}"
  tzg_web_acl = "${module.tzg_acls.web_acl}"
}


module "tzg_db" {
  source       = "db"
  ec2_region   = "${var.ec2_region}"
  vpc_id       = "${module.tzg_vpc.tzg_vpc_id}"
  subnet_id    = "${module.tzg_vpc.tzg_subnet_id}"
  tzg_db_acl   = "${module.tzg_acls.db_acl}"
  ssh_key_pair = "${module.tzg_www.ssh_key_pair}"
}
