# SSHのセキュリティグループ
resource "aws_security_group" "ssh" {
  name   = "ssh_sg"
  vpc_id = aws_vpc.this.id
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

####################################################
# Application Security Group
####################################################

resource "aws_security_group" "app" {
  name = "${var.resource_name}-app"
  description = "Security Group for Application"
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.resource_name}-app"
  }
}

resource "aws_security_group_rule" "app_from_this" {
  security_group_id = aws_security_group.app.id
  type = "ingress"
  description = "Allow from This"
  from_port = 0
  to_port = 0
  protocol = "-1"
  self = true
}

# resource "aws_security_group_rule" "app_from_alb" {
#   security_group_id = aws_security_group.app.id
#   type = "ingress"
#   description = "Allow from ALB"
#   from_port = 0
#   to_port = 0
#   protocol = "-1"
#   source_security_group_id = aws_security_group.alb.id
# }

resource "aws_security_group_rule" "app_to_any" {
  security_group_id = aws_security_group.app.id
  type = "egress"
  description = "Allow to Any"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}