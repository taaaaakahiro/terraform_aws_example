

# ec2モジュールを呼び出す
# module "ec2" {
#   source       = "../../modules/ec2"
#   system       = var.system
#   env          = var.env
#   vpc_id       = data.terraform_remote_state.demo-network.outputs.vpc_id
#   subnets      = data.terraform_remote_state.demo-network.outputs.subnets
#   myip         = var.myip
#   instance_cnt = var.instance_cnt
#   ami          = var.ami
#   type         = var.type
#   key_name     = var.key_name
# }

# module "elb" {
#   source = "../../modules/elb"
#   subnets      = module.vpc.subnets
#   system       = var.system
#   env          = var.env
#   vpc_id       = module.vpc.vpc_id
#   pub_instances = module.ec2.pub_instances
#   sg-elb = module.ec2.sg-elb
# }

module "ecr" {
  source = "../../modules/ecr"
}

module "rds" {
  source = "../../modules/rds"
  pri_subnet_id1 = data.terraform_remote_state.demo.outputs.pri_subnet_db1
  pri_subnet_id2 = data.terraform_remote_state.demo.outputs.pri_subnet_db2
} 


