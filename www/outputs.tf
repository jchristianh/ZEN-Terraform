output "www_name"     { value = "${aws_instance.tzg_web.tags["Name"]}" }
output "pri_ip"       { value = "${aws_instance.tzg_web.private_ip}"   }
output "pub_ip"       { value = "${aws_instance.tzg_web.public_ip}"    }
output "pub_dns"      { value = "${aws_instance.tzg_web.public_ip}"    }
output "ssh_key_path" { value = "${local.ssh_key_path}"                }
output "ssh_key_name" { value = "${local.ssh_key_name}"                }
output "ssh_user"     { value = "${local.ssh_user_name}"               }

