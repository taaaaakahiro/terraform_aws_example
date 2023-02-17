locals {
  app_name = "zenn"
  host_domain = "<取得したドメイン>"
  app_domain_name = "zenn-app.<取得したドメイン>"
  api_domain_name = "zenn-api.<取得したドメイン>"
  ssm_parameter_store_base = "/zenn/prod"
}

####################################################
# RDS SSM
####################################################

# data "aws_ssm_parameter" "database_name" {
#   name = "${local.ssm_parameter_store_base}/database_name"
# }

# data "aws_ssm_parameter" "database_user" {
#   name = "${local.ssm_parameter_store_base}/database_user"
# }

# data "aws_ssm_parameter" "database_password" {
#   name = "${local.ssm_parameter_store_base}/database_password"
# }

####################################################
# RDS SG
####################################################

resource "aws_security_group" "database_sg" {
  name        = "${local.app_name}-database-sg"
  description = "${local.app_name}-database"

  vpc_id = aws_vpc.this.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.app_name}-database-sg"
  }
}

resource "aws_security_group_rule" "database_sg_rule" {
  security_group_id = aws_security_group.database_sg.id

  type = "ingress"

  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  source_security_group_id = aws_security_group.app.id
}

resource "aws_db_subnet_group" "database_sg_group" {
  name        = "${local.app_name}-database-subnet-group"
  description = "${local.app_name}-database-subnet-group"
  subnet_ids  = [
    aws_subnet.private_1a.id,
    aws_subnet.private_1c.id,
    aws_subnet.private_1d.id,
  ]
}


####################################################
# VPC
####################################################

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = local.app_name
  }
}

####################################################
# Public Subnet
####################################################

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = local.app_name
  }
}

resource "aws_subnet" "public_1a" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${local.app_name}-public-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${local.app_name}-public-1c"
  }
}

resource "aws_subnet" "public_1d" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = "${local.app_name}-public-1d"
  }
}
####################################################
# Private Subnet
####################################################

resource "aws_subnet" "private_1a" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "${local.app_name}-private-1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${local.app_name}-private-1c"
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.30.0/24"
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = "${local.app_name}-private-1d"
  }
}
####################################################
# Elastic IP for nat
####################################################
resource "aws_eip" "nat_1a" {
  vpc = true
  tags = {
    Name = "${local.app_name}-eip-for-natgw-1a"
  }
}
####################################################
# NAT Gateway
####################################################
resource "aws_nat_gateway" "nat_1a" {
  subnet_id = aws_subnet.public_1a.id
  allocation_id = aws_eip.nat_1a.id
  tags = {
    Name = "${local.app_name}-natgw-1a"
  }
}
####################################################
# Public Subnet Route Table
####################################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "${local.app_name}-public"
  }
}
####################################################
# Public Route Table Association
####################################################

resource "aws_route_table_association" "public_1a_to_ig" {
  subnet_id = aws_subnet.public_1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1c_to_ig" {
  subnet_id = aws_subnet.public_1c.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_1d_to_ig" {
  subnet_id = aws_subnet.public_1d.id
  route_table_id = aws_route_table.public.id
}

####################################################
# Private Subnet Route Table
####################################################
resource "aws_route_table" "private_1a" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_1a.id
  }
  tags = {
    Name = "${local.app_name}-private-1a"
  }
}

####################################################
# Private Route Table Association
####################################################
resource "aws_route_table_association" "private_1a" {
  route_table_id = aws_route_table.private_1a.id
  subnet_id = aws_subnet.private_1a.id
}
