resource "aws_db_subnet_group" "database_sg_group" {
  name        = "${var.env}-${var.service}-database-subnet-group"
  description = "${var.env}-${var.service}-database-subnet-group"
  subnet_ids  = [
    aws_subnet.private_1a.id,
    aws_subnet.private_1c.id,
    aws_subnet.private_1d.id,
  ]
}