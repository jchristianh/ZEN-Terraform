# VPC for The Zen Garden AWS Cloud

resource "aws_vpc" "tzg_vpc" {
  cidr_block           = "${var.tzg_vpc_cidr}"
  instance_tenancy     = "${var.instance_tenancy}"
  enable_dns_hostnames = "true"

  tags = {
    Name     = "TZG Private Cloud"
    Location = "${var.ec2_region}"
  }
}

resource "aws_subnet" "tzg_subnet" {
  vpc_id                  = "${aws_vpc.tzg_vpc.id}"
  cidr_block              = "${var.tzg_subnet}"
  map_public_ip_on_launch = "true"
  depends_on              = ["aws_internet_gateway.tzg_gateway"]

  tags = {
    Name     = "TZG Subnet 1"
    Location = "${var.ec2_region}"
  }
}

resource "aws_internet_gateway" "tzg_gateway" {
  vpc_id = "${aws_vpc.tzg_vpc.id}"

  tags = {
    Name     = "TZG Gateway"
    Location = "${var.ec2_region}"
  }
}

resource "aws_route_table" "the_world" {
  vpc_id = "${aws_vpc.tzg_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tzg_gateway.id}"
  }

  tags = {
    Name     = "TZG World Route"
    Location = "${var.ec2_region}"
  }
}

resource "aws_route_table_association" "tzg_world_1a" {
  subnet_id      = "${aws_subnet.tzg_subnet.id}"
  route_table_id = "${aws_route_table.the_world.id}"
}
