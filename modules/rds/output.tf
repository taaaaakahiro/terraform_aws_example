output "rds_password" {
    value = random_string.db_password.result
} 