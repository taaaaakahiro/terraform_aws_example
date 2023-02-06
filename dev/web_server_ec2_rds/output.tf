// rds
output "db_password" {
    value = module.rds.rds_password
}

// iam
output "iam_instance_profile_name"{
    value = module.iam.iam_instance_profile_name
}


// ec2
output "aws_eip" {
    value = module.ec2.aws_eip
}

output "public_ip" {
    value = module.ec2.public_ip
}

output "ssh_command" {
    value = module.ec2.ssh_command
}