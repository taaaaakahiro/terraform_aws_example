resource "aws_db_instance" "rds" {
  identifier           = "${var.env}-${var.system}-rds-postgres"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "12.7"
  instance_class       = "db.t3.micro"
  db_name              = "example"
  username             = "demo_admin"
  password             = random_string.db_password.result
  vpc_security_group_ids  = ["${aws_security_group.db.id}"]
  db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
  skip_final_snapshot = true
}

# ランダム文字列の初生成時はinitが必要
resource "random_string" "db_password" {
  length = 16
  special = false
}
