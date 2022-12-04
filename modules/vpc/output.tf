output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "pub_subnet_web1" {
  value = aws_subnet.pub_subnet_1a.id
}

output "pub_subnet_web2" {
  value = aws_subnet.pub_subnet_1c.id
}

output "pri_subnet_db1" {
  value = aws_subnet.pri_subnet_1a.id
}

output "pri_subnet_db2" {
  value = aws_subnet.pri_subnet_1c.id
}

