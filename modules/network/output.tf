output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_subnet_1a" {
  value = aws_subnet.pub_subnet_1a.id
}

output "pub_subnet_1c" {
  value = aws_subnet.pub_subnet_1c.id
}

output "pri_subnet_1a" {
  value = aws_subnet.pri_subnet_1a.id
}

output "pri_subnet_1c" {
  value = aws_subnet.pri_subnet_1c.id
}

output "aws_security_group_bation_id" {
  value = aws_security_group.bation.id
}
