# Return required variables back to ../main.tf for further usage:
#################################################################
output "web_acl" {
  value = "${aws_security_group.tzg_web_acl.id}"
}


output "db_acl" {
  value = "${aws_security_group.tzg_db_acl.id}"
}
