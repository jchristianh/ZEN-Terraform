output "ssh_key_pair" { value = "${aws_key_pair.keys.key_name}"        }
output "ssh_key_path" { value = "${local.ssh_key_path}"                }
output "ssh_key_name" { value = "${local.ssh_key_name}"                }
output "ssh_user"     { value = "${local.ssh_user_name}"               }