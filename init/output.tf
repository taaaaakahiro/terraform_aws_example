output "vpc_id" {
    value = module.network.vpc_id
}

output "pub_subnet_1a" {
    value = module.network.pub_subnet_1a
}

output "pub_subnet_1c" {
    value = module.network.pub_subnet_1c
}

output "pri_subnet_1a" {
  value = module.network.pri_subnet_1a
}

output "pri_subnet_1c" {
  value = module.network.pri_subnet_1c
}

output "pri_subnet_db_1a" {
  value = module.network.pri_subnet_db_1a
}

output "pri_subnet_db_1c" {
  value = module.network.pri_subnet_db_1c
}

output "pri_subnet_db_1d" {
  value = module.network.pri_subnet_db_1d
}

output "aws_security_group_bation_id" {
  value = module.network.aws_security_group_bation_id
}