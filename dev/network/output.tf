output "vpc_id" {
    value = module.vpc.vpc_id
}

output "pub_subnet_web1" {
    value = module.vpc.pub_subnet_web1
}

output "pub_subnet_web2" {
    value = module.vpc.pub_subnet_web2
}

output "pri_subnet_db1" {
  value = module.vpc.pri_subnet_db1 ## ここではmoduleのoutputを指定する。
}

output "pri_subnet_db2" {
  value = module.vpc.pri_subnet_db2 ## ここではmoduleのoutputを指定する。
}