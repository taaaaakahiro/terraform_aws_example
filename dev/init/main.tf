
# vpcモジュールを呼び出す
module "vpc" {
  source       = "../../modules/vpc"
  system       = var.system
  env          = var.env
  cidr_vpc     = var.vpc_cidr
  cidr_public_1a  = var.cidr_public_1a
  cidr_public_1c  = var.cidr_public_1c
  cidr_private_1a = var.cidr_private_1a
  cidr_private_1c = var.cidr_private_1c
}

module "ecr" {
  source = "../../modules/ecr"
}
