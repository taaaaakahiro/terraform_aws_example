

####################################################
# RDS SG
####################################################

resource "aws_security_group" "database_sg" {
  name        = "${local.app_name}-database-sg"
  description = "${local.app_name}-database"

  vpc_id = aws_vpc.this.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.app_name}-database-sg"
  }
}

resource "aws_security_group_rule" "database_sg_rule" {
  security_group_id = aws_security_group.database_sg.id

  type = "ingress"

  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  source_security_group_id = aws_security_group.app.id
}

resource "aws_db_subnet_group" "database_sg_group" {
  name        = "${local.app_name}-database-subnet-group"
  description = "${local.app_name}-database-subnet-group"
  subnet_ids  = [
    aws_subnet.private_1a.id,
    aws_subnet.private_1c.id,
    aws_subnet.private_1d.id,
  ]
}