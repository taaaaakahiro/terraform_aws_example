
####################################################
# RDS Cluster
####################################################

resource "aws_rds_cluster" "this" {
  cluster_identifier              = "${var.env}-${var.service}-database-cluster"
  db_subnet_group_name            = aws_db_subnet_group.database_sg_group.name
  vpc_security_group_ids          = [aws_security_group.database_sg.id]
  engine                          = "aurora-mysql"
  engine_version                  = "8.0.mysql_aurora.3.01.0"
  port                            = "3306"
  database_name                   = "example"
  master_username                 = "demo_admin"
  master_password                 = "adminadmin"
  # database_name   = data.aws_ssm_parameter.database_name.value
  # master_username = data.aws_ssm_parameter.database_user.value
  # master_password = data.aws_ssm_parameter.database_password.value
  skip_final_snapshot             = true
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.this.name
}

####################################################
# RDS Cluster Instance
####################################################

resource "aws_rds_cluster_instance" "this" {
  identifier           = "${var.env}-${var.service}-database-cluster-instance"
  cluster_identifier   = aws_rds_cluster.this.id
  engine               = aws_rds_cluster.this.engine
  engine_version       = aws_rds_cluster.this.engine_version
  instance_class       = "db.t4g.medium"
  db_subnet_group_name = aws_rds_cluster.this.db_subnet_group_name
}

####################################################
# RDS cluster config
####################################################

resource "aws_rds_cluster_parameter_group" "this" {
  name   = "${var.env}-${var.service}-database-cluster-parameter-group"
  family = "aurora-mysql8.0"

  parameter {
    name  = "time_zone"
    value = "Asia/Tokyo"
  }
}

# ランダム文字列の初生成時はinitが必要
resource "random_string" "db_password" {
  length = 16
  special = false
}