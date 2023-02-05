#----------------------------------------
# RDS instance
#----------------------------------------
resource "aws_db_instance" "mysql_standalone" {
  engine = "mysql"
  engine_version = "8.0"
  # dbの名前（任意）
  identifier = "demo-mysql-standalone"
  username = "admin"
  # パスワード。上記で生成したランダムな文字列を設定
  password = random_string.db_password.result
  instance_class = "db.t2.micro"
  allocated_storage = 20
  max_allocated_storage = 50
  storage_type = "gp2"
  storage_encrypted = false
  # マルチAZの設定を行うかどうか設定する
  multi_az = false
  # マルチAZを行わない場合は、DBの配置先を指定する
  availability_zone = "ap-northeast-1a"
  db_subnet_group_name = aws_db_subnet_group.mysql_subnet_group.name
  publicly_accessible = false
  port = 3306
  db_name = "example"
  parameter_group_name = aws_db_parameter_group.mysql_parameter_group.name
  option_group_name = aws_db_option_group.mysql_option_group.name


  # -- DBの管理設定。maintenance_windowは、backup_windowの後の時間に設定する
  # バックアップを行う時間を設定
  backup_window = "04:00-05:00"
  # バックアップの保存期間（日）を設定
  backup_retention_period = 0
  # DBインスタンスまたはクラスターのエンジンバージョンの更新、OS更新があった場合に更新作業を行う時間を設定
  maintenance_window = "Mon:05:00-Mon:08:00"
  # 自動的にDBのマイナーバージョンアップグレードを行うか設定する
  auto_minor_version_upgrade = false


  # -- 削除設定
  # 削除操作を受付るかを指定。削除させない場合はtrue
  deletion_protection = false
  # インスタンス削除時にスナップショットをとるかを設定
  skip_final_snapshot = true
  # DBインスタンスが削除されたときに保存するスナップショットの名前 skip_final_snapshot = falseの時に指定
  final_snapshot_identifier = "final-snapshot-lab"
  # データベースの変更をすぐに適用するか、次のメンテナンスウィンドウ中に適用するかを指定する
  apply_immediately = true


  # -- タグの設定
  tags = {
     Name = "demo-mysql-option-standalone"
     Project = "test"
     Env = "lab"
  }
}


# ランダム文字列の初生成時はinitが必要
resource "random_string" "db_password" {
  length = 16
  special = false
}