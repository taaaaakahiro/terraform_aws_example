
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

# resource "aws_subnet" "public_1a" {
#   vpc_id = aws_vpc.this.id
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "ap-northeast-1a"
#   tags = {
#     Name = "${local.app_name}-public-1a"
#   }
# }

# resource "aws_subnet" "public_1c" {
#   vpc_id = aws_vpc.this.id
#   cidr_block = "10.0.2.0/24"
#   availability_zone = "ap-northeast-1c"
#   tags = {
#     Name = "${local.app_name}-public-1c"
#   }
# }

# resource "aws_subnet" "public_1d" {
#   vpc_id     = aws_vpc.this.id
#   cidr_block = "10.0.3.0/24"
#   availability_zone = "ap-northeast-1d"
#   tags = {
#     Name = "${local.app_name}-public-1d"
#   }
# }

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
