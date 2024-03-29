# --------------------------------------------------------------
# VPC
# --------------------------------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_vpc
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.service}-vpc"
    Cost = "${var.service}"
    Env = "${var.env}"
  }
}

