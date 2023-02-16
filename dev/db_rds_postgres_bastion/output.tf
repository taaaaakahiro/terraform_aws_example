output "rds_password" {
    value = module.rds_postgres.rds_password
}

output "db_instace_endpoint" {
value = module.rds_postgres.db_instace_endpoint
}