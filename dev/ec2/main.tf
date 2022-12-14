# 最新のAmazonLinux2のイメージ
data "aws_ami" "latest_amzn2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# キーペア
# 変数で指定した値を設定
resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file("${var.key_name}.pub")
}

# EIPを使う場合は以下を追加する
# resource "aws_eip" "this" {
#   instance = aws_instance.this.id
#   vpc      = true
# }

# インスタンス
resource "aws_instance" "this" {
  instance_type = "t3.micro" # インスタンスタイプは任意に設定する

  vpc_security_group_ids = [aws_security_group.ssh.id]
  # httpのSGを追加する場合は以下のようにする
  # vpc_security_group_ids = [aws_security_group.ssh.id, aws_security_group.http.id]

  # EBSのサイズとタイプを指定する場合は以下のように追加する
  # root_block_device {
  #   volume_size = 30 # 単位GB
  #   volume_type = "gp3" # gp2がデフォルト。 他はstandard, gp3, io1, io2, sc1, st1。
  # }

  ami = data.aws_ami.latest_amzn2.id

  subnet_id = aws_subnet.public.id

  key_name = aws_key_pair.this.key_name

  tags = {
    Name = var.resource_name # インスタンス名
  }

  lifecycle {
    ignore_changes = [
      ami # インスタンスに変更を加えようとしたら、AMIが新しくなっていてインスタンス再作成が要求されるのを防止するため
    ]
  }
}