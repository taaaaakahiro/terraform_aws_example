# パブリックIPを出力
output "public_ip" {
  value = aws_instance.this.public_ip
}

# sshコマンドを出力
output "ssh_command" {
  value = "ssh -i ${var.key_name} ec2-user@${aws_instance.this.public_ip}"
}