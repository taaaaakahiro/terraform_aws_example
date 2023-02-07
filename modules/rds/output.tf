output "rds_password" {
    value = random_string.db_password.result
} 

output "db_instace_endpoint" {
    value = aws_db_instance.rds.endpoint
}