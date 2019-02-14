# AWS Core Variables:
#####################
variable "ec2_region"       { default = "us-east-1" }
variable "instance_tenancy" { default = "default"   }
variable "instance_type"    { default = "t2.micro"  }


# ACL Instance Rules:
#####################
variable "tzg_web_ports" {
  default {
    "ssh"           = 22
    "ssh_proto"     = "tcp"
    "web"           = 80
    "web_proto"     = "tcp"
    "web_ssl"       = 443
    "web_ssl_proto" = "tcp"
  }
}


# VPC/Instance Network Variables
################################
variable "tzg_vpc_cidr" { default = "10.2.0.0/16" }
variable "tzg_subnet"   { default = "10.2.2.0/24" }

variable "web_pri_ip"   { default = "10.2.2.100"  }
variable "db_pri_ip"    { default = "10.2.2.200"  }


# Instances of each service to run:
# (unused for now)
###################################
variable "web_instance_count" { default = 1 }
variable "db_instance_count"  { default = 1 }


# Package list for package pre-install prior
# to provision via configuration management:
############################################
variable "web_install_pkgs" { default = "epel-release perl ansible git httpd mariadb"  }
variable "db_install_pkgs"  { default = "epel-release perl ansible git mariadb-server" }

