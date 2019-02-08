# Web Server for The Zen Garden AWS Cloud

resource "aws_key_pair" "keys" {
  key_name   = "${local.ssh_key_name}"
  public_key = "${local.ssh_pub_key}"
}

resource "aws_instance" "tzg_web" {
  ami                    = "${data.aws_ami.centos.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.keys.key_name}"
  vpc_security_group_ids = ["${var.tzg_web_acl}"]
  subnet_id              = "${var.subnet_id}"

  tags = {
    Name     = "TZG Web"
    Location = "${var.ec2_region}"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = "20"
  }

  # run yum update -y on creation and install
  # some base packages:
  #  provisioner "remote-exec" {
  #    inline = ["sudo yum update -y; sudo yum install -y epel-release perl ansible git"]
  #
  #    connection {
  #      type        = "ssh"
  #      user        = "${local.ssh_user_name}"
  #      private_key = "${local.ssh_sec_key}"
  #    }
  #  }
}
