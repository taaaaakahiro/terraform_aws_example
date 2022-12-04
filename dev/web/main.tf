module "iam" {
  source = "../../modules/iam"
  name = local.system
  db_password = module.rds.rds_password
}

module "ec2" {
  source       = "../../modules/ec2"
  system       = local.system
  env          = local.env
  vpc_id       = data.terraform_remote_state.demo.outputs.vpc_id
  subnets      = data.terraform_remote_state.demo.outputs.pub_subnet_web1
  myip         = local.myip
  instance_cnt = local.instance_cnt
  ami          = local.ami
  type         = local.instance_type
  key_name     = local.key_name
  iam_instance_profile = module.iam.iam_instance_profile_name
}

module "elb" {
  source = "../../modules/elb"
  subnets      = [
    data.terraform_remote_state.demo.outputs.pub_subnet_web1,
    data.terraform_remote_state.demo.outputs.pub_subnet_web2,
  ]
  system       = local.system
  env          = local.env
  vpc_id       = data.terraform_remote_state.demo.outputs.vpc_id
  pub_instances = module.ec2.pub_instances
  sg-elb = module.ec2.sg-elb
}

module "rds" {
  source = "../../modules/rds"
  pri_subnet_id1 = data.terraform_remote_state.demo.outputs.pri_subnet_db1
  pri_subnet_id2 = data.terraform_remote_state.demo.outputs.pri_subnet_db2
}




