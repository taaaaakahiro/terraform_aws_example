resource "aws_security_group" "ssh" {
  name   = "ssh_sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # 接続元を限定する場合は変更する
  security_group_id = aws_security_group.ssh.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh.id
}


# resource "aws_security_group" "sg-ec2" {
#   name        = "tf-sample-module-sg-http"
#   description = "Allow HTTP inbound traffic"
#   vpc_id      = var.vpc_id

#   ingress {
#     from_port       = 80
#     to_port         = 80
#     protocol        = "tcp"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port       = 22
#     to_port         = 22
#     protocol        = "tcp"
#     cidr_blocks     = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.env}-${var.system}-sg-http"
#     Cost = "${var.system}"
#   }
# }

# resource "aws_security_group" "sg-elb" {
#   name        = "tf-sample-module-sg-elb"
#   description = "Allow HTTP inbound traffic"
#   vpc_id      = var.vpc_id
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [var.myip]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "${var.env}-${var.system}-sg-http"
#     Cost = "${var.system}"
#   }
# }
