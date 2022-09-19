# vpcモジュールを呼び出す
module "vpc" {
  source       = "../../modules/vpc"
  system       = var.system
  env          = var.env
  cidr_vpc     = var.vpc_cidr
  cidr_public  = var.cidr_public
}

# ec2モジュールを呼び出す
module "ec2" {
  source       = "../../modules/ec2"
  system       = var.system
  env          = var.env
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.subnets
  myip         = var.myip
  instance_cnt = var.instance_cnt
  ami          = var.ami
  type         = var.type
  key_name     = var.key_name
}

# module "elb" {
#   source = "../../modules/elb"
#   subnets      = module.vpc.subnets
#   system       = var.system
#   env          = var.env
#   vpc_id       = module.vpc.vpc_id
#   pub_instances = module.ec2.pub_instances
#   sg-elb = module.ec2.sg-elb
#   # myip         = var.myip
#   # instance_cnt = var.instance_cnt
#   # ami          = var.ami
#   # type         = var.type
# }