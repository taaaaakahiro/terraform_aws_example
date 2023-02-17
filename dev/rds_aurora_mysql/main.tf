module "rds_aurora_mysql" {
    source           = "../../modules/rds_aurora"
    env              = local.env
    service          = local.service
}