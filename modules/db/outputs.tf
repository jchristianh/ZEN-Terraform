# Return required variables back to ../main.tf for further usage:
#################################################################
output "db_name"      { value = "${aws_instance.tzg_db.tags["Name"]}" }
output "pri_ip"       { value = "${aws_instance.tzg_db.private_ip}"   }
output "pub_ip"       { value = "${aws_instance.tzg_db.public_ip}"    }
output "pub_dns"      { value = "${aws_instance.tzg_db.public_ip}"    }