resource "aws_instance" "ec2" {
  count                       = var.instance_cnt
  ami                         = var.ami
  instance_type               = var.type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.sg_bastion_ssh]
  iam_instance_profile        = var.iam_instance_profile
  subnet_id                   = var.pub_subnet_1a
  associate_public_ip_address = "true"
  tags                        = {
    Name = "${var.env}-${var.service}-web"
    Cost = "${var.service}"
  }
}