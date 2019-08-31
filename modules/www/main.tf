# Web Server for The Zen Garden AWS Cloud:
##########################################
resource "aws_instance" "tzg_web" {
  ami                    = "${data.aws_ami.centos.id}"
  instance_type          = "${var.instance_type}"
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

  provisioner "local-exec" {
    command = "sleep ${var.ansible_sleep_delay};ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ${var.ssh_key_user} -i '${aws_instance.tzg_web.public_ip},' --private-key '${var.ssh_key_path}/${var.ssh_key_name}.pri' ${var.ansible_playbook} -e system_role=${var.www_ansible_role}"
  }
}
