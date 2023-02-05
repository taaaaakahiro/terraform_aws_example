module "iam" {
  source = "../../modules/iam"
  name = local.system
  db_password = module.rds.rds_password
}

module "ec2" {
  source        = "../../modules/ec2"
  system        = local.system
  env           = local.env
  vpc_id        = data.terraform_remote_state.network.outputs.vpc_id
  # subnets       = [
  #   data.terraform_remote_state.demo.outputs.pub_subnet_1a,
  #   data.terraform_remote_state.demo.outputs.pub_subnet_1d
  # ]
  subnets       = data.terraform_remote_state.network.outputs.pub_subnet_1a
  myip          = local.myip
  instance_cnt  = local.instance_cnt
  ami           = local.ami
  type          = local.instance_type
  key_name      = local.key_name
  iam_instance_profile = module.iam.iam_instance_profile_name
}

module "elb" {
  source = "../../modules/elb"
  subnets       = [
    data.terraform_remote_state.network.outputs.pub_subnet_1a,
    data.terraform_remote_state.network.outputs.pub_subnet_1c,
  ]
  system        = local.system
  env           = local.env
  vpc_id        = data.terraform_remote_state.network.outputs.vpc_id
  pub_instances = module.ec2.pub_instances
  sg-elb = module.ec2.sg-elb
}

module "rds" {
  source = "../../modules/rds"
  pri_subnet_1a = data.terraform_remote_state.network.outputs.pri_subnet_1a
  pri_subnet_1c = data.terraform_remote_state.network.outputs.pri_subnet_1c
}




