# Return required variables back to ../main.tf for further usage:
#################################################################
output "tzg_vpc_id" {
  value = "${aws_vpc.tzg_vpc.id}"
}

output "tzg_subnet_id" {
  value = "${aws_subnet.tzg_subnet.id}"
}
