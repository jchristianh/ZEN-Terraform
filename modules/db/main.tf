# Database Server for The Zen Garden AWS Cloud

resource "aws_instance" "tzg_db" {
  ami                    = "${data.aws_ami.centos.id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.ssh_key_pair}"
  vpc_security_group_ids = ["${var.tzg_db_acl}"]
  subnet_id              = "${var.subnet_id}"
  private_ip             = "${var.private_ip}"

  tags = {
    Name     = "TZG DB"
    Location = "${var.ec2_region}"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = "${var.volume_size}"
    volume_type           = "${var.volume_type}"
  }

  # run yum update -y on creation and install
  # some base packages:
    provisioner "remote-exec" {
      inline = ["sudo yum update -y; sudo yum install -y ${var.db_install_pkgs}"]

      connection {
        type        = "ssh"
        user        = "${local.ssh_user_name}"
        private_key = "${local.ssh_sec_key}"
      }
    }
}