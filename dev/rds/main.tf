# module "rds_mysql" {
#     source = "../../modules/rds_mysql"
#     env = local.env 
#     system = local.system
#     vpc_id = data.terraform_remote_state.init.outputs.vpc_id
#     pri_subnet_1a = data.terraform_remote_state.init.outputs.pri_subnet_1a
#     pri_subnet_1c = data.terraform_remote_state.init.outputs.pri_subnet_1c
# }

module "rds_postgres" {
    source = "../../modules/rds_postgres"
    env = local.env 
    system = local.system
    vpc_id = data.terraform_remote_state.init.outputs.vpc_id
    pri_subnet_1a = data.terraform_remote_state.init.outputs.pri_subnet_1a
    pri_subnet_1c = data.terraform_remote_state.init.outputs.pri_subnet_1c
}



