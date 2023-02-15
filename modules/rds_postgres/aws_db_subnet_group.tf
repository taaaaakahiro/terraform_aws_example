#----------------------------------------
# RDS subnet group
#----------------------------------------
resource "aws_db_subnet_group" "mysql_subnet_group" {
  name = "${var.env}-${var.system}-postgres-subnet"
  # subnetの設定
  subnet_ids = [
    var.pri_subnet_1a,
    var.pri_subnet_1c,
  ]
  tags = {
     Name = "${var.env}-${var.system}-postgres-option"
     Project = "${var.env}-${var.system}"
     Env = var.env
  }
}