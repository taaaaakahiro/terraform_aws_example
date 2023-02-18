resource "aws_db_subnet_group" "database_sg_group" {
  name        = "${var.env}-${var.service}-database-subnet-group"
  description = "${var.env}-${var.service}-database-subnet-group"
  subnet_ids  = [
    var.pri_subnet_db_1a,
    var.pri_subnet_db_1c,
    var.pri_subnet_db_1d,
  ]
}