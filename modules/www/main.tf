# Web Server for The Zen Garden AWS Cloud

#resource "aws_key_pair" "keys" {
#  key_name   = "${local.ssh_key_name}"
#  public_key = "${local.ssh_pub_key}"
#}

resource "aws_instance" "tzg_web" {
  ami                    = "${data.aws_ami.centos.id}"
  instance_type          = "${var.instance_type}"
#  key_name               = "${aws_key_pair.keys.key_name}"
  key_name               = "${var.ssh_key_pair}"
  vpc_security_group_ids = ["${var.tzg_web_acl}"]
  subnet_id              = "${var.subnet_id}"
  private_ip             = "${var.private_ip}"

  tags = {
    Name     = "TZG Web"
    Location = "${var.ec2_region}"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = "${var.volume_size}"
    volume_type           = "${var.volume_type}"
  }

  # run yum update -y on creation and install
  # some base packages:
#    provisioner "remote-exec" {
#      inline = ["sudo yum update -y; sudo yum install -y ${var.web_install_pkgs}"]
#
#      connection {
#        type        = "ssh"
#        user        = "${var.ssh_user_name}"
#        private_key = "${var.ssh_sec_key}"
#      }
#    }

  provisioner "local-exec" {
    command = "sleep 120;ansible-playbook -u ${var.ssh_key_user} -i '${aws_instance.tzg_web.public_ip},' --private-key '${var.ssh_key_path}/${var.ssh_key_name}.pri' ${var.ansible_playbook} -e 'host_key_checking=False' -e system_role=webserver"

    environment {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}
