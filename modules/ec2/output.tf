# output "sg-ec2" {
#   value = aws_security_group.sg-ec2.id
# }

# output "sg-elb" {
#   value = aws_security_group.sg-elb.id
# }

output "pub_instances" {
  value = aws_instance.ec2
}

output "aws_eip" {
  value = aws_eip.demo-eip.public_ip
}

# パブリックIPを出力
output "public_ip" {
  value = aws_instance.ec2[0].public_ip
}

# sshコマンドを出力
output "ssh_command" {
  value = "ssh -i ${var.key_name} ec2-user@${aws_eip.demo-eip.public_ip}"
}