
resource "aws_instance" "ec2" {
  count         = var.instance_cnt
  ami           = var.ami
  instance_type = var.type
  key_name      = aws_key_pair.ec2-key.key_name
  vpc_security_group_ids = ["${aws_security_group.sg-ec2.id}"]
  iam_instance_profile        = var.iam_instance_profile
  subnet_id                   = var.subnets
  associate_public_ip_address = "true"
  tags = {
    Name = "${var.env}-${var.system}-web"
    Cost = "${var.system}"
  }
}

resource "aws_eip" "demo-eip" {
  instance = aws_instance.ec2[0].id
  vpc      = true
}

#--------------------------------------------------------------
# Key Pair
#--------------------------------------------------------------

resource "aws_key_pair" "ec2-key" {
  key_name   = "common-ssh"
  public_key = tls_private_key._.public_key_openssh
}

resource "tls_private_key" "_" {
  algorithm = "RSA"
  rsa_bits  = 4096
}