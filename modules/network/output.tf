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

output "pri_subnet_db_1a" {
  value = aws_subnet.pri_subnet_db_1a.id
}

output "pri_subnet_db_1c" {
  value = aws_subnet.pri_subnet_db_1c.id
}

output "pri_subnet_db_1d" {
  value = aws_subnet.pri_subnet_db_1d.id
}

output "aws_security_group_bation_id" {
  value = aws_security_group.bation.id
}

output "sg_vpce_id" {
  value = aws_security_group.vpce.id
}

output "sg_alb_id" {
  value = aws_security_group.alb.id
}

output "sg_alb_container_id" {
  value = aws_security_group.container.id
}