output "sg-ec2" {
  value = aws_security_group.sg-ec2.id
}

output "sg-elb" {
  value = aws_security_group.sg-elb.id
}

output "pub_instances" {
  value = aws_instance.ec2
}