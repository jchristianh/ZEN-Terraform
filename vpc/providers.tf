provider "aws" {
  version                 = "~> 1.57"
  region                  = "${var.ec2_region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "testing"
}
