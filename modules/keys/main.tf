# SSH Key Setup for The Zen Garden AWS Cloud
############################################
resource "aws_key_pair" "keys" {
  key_name   = "${local.ssh_key_name}"
  public_key = "${local.ssh_pub_key}"
}