####################################################
# RDS SG
####################################################

resource "aws_security_group" "database_sg" {
  name        = "${var.env}-${var.service}-database-sg"
  description = "${var.env}-${var.service}-database"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.env}-${var.service}-database-sg"
  }
}

resource "aws_security_group_rule" "ingress" {
  security_group_id = aws_security_group.database_sg.id
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # 接続元を限定する場合は変更する
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] # 接続元を限定する場合は変更する
  security_group_id = aws_security_group.database_sg.id
}