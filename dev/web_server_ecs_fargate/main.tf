data "aws_caller_identity" "current" {}

module "ecs" {
  source                    = "../../modules/ecs"
  env                       = local.env
  service                   = local.service
  account_id                = data.aws_caller_identity.current.account_id
  alb_tg_arn                = module.alb.alb_tg_arn
  subnet_container_1a       = module.network.pri_subnet_1a
  subnet_container_1c       = module.network.pri_subnet_1c
  container_definition_file = file("./container_definition.json")
  sg_alb_id                 = module.network.sg_alb_container_id
}

module "network" {
  source = "../../modules/network"
  service            = local.service
  env                = local.env
  cidr_vpc           = local.vpc_cidr
  cidr_public_1a     = local.cidr_pub_1a
  cidr_public_1c     = local.cidr_pub_1c
  cidr_private_1a    = local.cidr_pri_1a
  cidr_private_1c    = local.cidr_pri_1c
  cidr_private_db_1a = local.cidr_pri_db_1a
  cidr_private_db_1c = local.cidr_pri_db_1c
  cidr_private_db_1d = local.cidr_pri_db_1d
}

module "alb" {
  source            = "../../modules/alb"
  env               = local.env
  service           = local.service
  vpc_id            = module.network.vpc_id
  pub_subnet_alb_1a = module.network.pub_subnet_1a
  pub_subnet_alb_1c = module.network.pub_subnet_1c
  sg_elb            = module.network.sg_alb_id
}

# module "rds" {
#   source           = "../../modules/rds_aurora"
#   env              = local.env
#   service          = local.service
#   vpc_id           = module.network.vpc_id
#   pri_subnet_db_1a = module.network.pri_subnet_db_1a
#   pri_subnet_db_1c = module.network.pri_subnet_db_1c
#   pri_subnet_db_1d = module.network.pri_subnet_db_1d
# }