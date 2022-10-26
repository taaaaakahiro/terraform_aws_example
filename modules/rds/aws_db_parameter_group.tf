#----------------------------------------
# RDS parameter group
#----------------------------------------
resource "aws_db_parameter_group" "mysql_parameter_group" {
  name = "demo-mysql-param-standalone"
  family = "mysql8.0"

  # データベースに設定するパラメーター
  parameter {
    name = "character_set_database"
    value = "utf8mb4"
  }
  parameter {
    name = "character_set_server"
    value = "utf8mb4"
  }
}

#----------------------------------------
# RDS option group
#----------------------------------------
resource "aws_db_option_group" "mysql_option_group" {
  name = "demo-mysql-option-standalone"
  engine_name = "mysql"
  major_engine_version = "8.0"
}

#----------------------------------------
# RDS subnet group
#----------------------------------------
resource "aws_db_subnet_group" "mysql_subnet_group" {
  name = "demo-mysql-subnet-standalone"
  # subnetの設定
  subnet_ids = [var.pri_subnet_id1,var.pri_subnet_id2]
  tags = {
     Name = "demo-mysql-option-standalone"
     Project = "test"
     Env = "lab"
  }
}


