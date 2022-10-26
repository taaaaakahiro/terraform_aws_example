output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_web1" {
  value = aws_subnet.public_subnet_1a.id
}

output "public_subnet_web2" {
  value = aws_subnet.public_subnet_1c.id
}

output "pri_subnet_db1" {
  value = aws_subnet.private_subnet_1a.id
}

output "pri_subnet_db2" {
  value = aws_subnet.private_subnet_1c.id
}

