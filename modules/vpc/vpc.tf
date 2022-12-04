# --------------------------------------------------------------
# VPC
# --------------------------------------------------------------
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_vpc
  instance_tenancy     = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.env}-${var.system}-vpc"
    Cost = "${var.system}"
    Env = "${var.env}"
  }
}

# --------------------------------------------------------------
# Subnet  パブリック、プライベート用にそれぞれ2つずつ構築
# --------------------------------------------------------------
resource "aws_subnet" "pub_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr_public_1a
  availability_zone = "ap-northeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-${var.system}-pub-1a"
    Cost = "${var.system}"
  }
}

resource "aws_subnet" "pub_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.cidr_public_1c
  availability_zone = "ap-northeast-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-${var.system}-pub-1c"
    Cost = "${var.system}"
  }
}

resource "aws_subnet" "pri_subnet_1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_private_1a
    availability_zone = "ap-northeast-1a"
    tags = {
      Name = "private_subnet_1a"
    }
}

resource "aws_subnet" "pri_subnet_1c" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_private_1c
    availability_zone = "ap-northeast-1c"
    tags = {
      Name = "private_subnet_1c"
    }
}

# --------------------------------------------------------------
# Route Table
# --------------------------------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.env}-${var.system}-pub-rt"
    Cost = "${var.system}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-${var.system}-pub-rt"
    Cost = "${var.system}"
  }
}

resource "aws_route_table_association" "private_route_table_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private_route_table_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private.id
}

# --------------------------------------------------------------
# Internet Gateway
# --------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-${var.system}-igw"
    Cost = "${var.system}"
  }
}