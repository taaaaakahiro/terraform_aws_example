output "db_password" {
    value = module.rds.rds_password
}

output "iam_instance_profile_name"{
    value = module.iam.iam_instance_profile_name
}