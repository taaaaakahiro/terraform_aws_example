
resource "aws_instance" "ec2" {
  count         = var.instance_cnt
  ami           = var.ami
  instance_type = var.type
  key_name      = var.key_name
  vpc_security_group_ids = [
    "${aws_security_group.sg-ec2.id}"
  ]
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