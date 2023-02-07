// rds
output "db_password" {
    value = module.rds.rds_password
}

output "db_instace_endpoint" {
    value = module.rds.db_instace_endpoint
}

// iam
output "iam_instance_profile_name"{
    value = module.iam.iam_instance_profile_name
}


// ec2
output "aws_eip" {
    value = module.ec2.aws_eip
}

output "ssh_command" {
    value = module.ec2.ssh_command
}