# Return required variables back to ../main.tf for further usage:
#################################################################
output "www_name"     { value = "${aws_instance.tzg_web.tags["Name"]}" }
output "pri_ip"       { value = "${aws_instance.tzg_web.private_ip}"   }
output "pub_ip"       { value = "${aws_instance.tzg_web.public_ip}"    }
output "pub_dns"      { value = "${aws_instance.tzg_web.public_ip}"    }
