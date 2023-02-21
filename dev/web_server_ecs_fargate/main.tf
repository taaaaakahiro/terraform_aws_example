# module "ecs" {
#   source = "../../modules/ecs"
#   env = var.env
# }

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