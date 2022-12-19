####################################################
# VPC
####################################################

resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16" # 値が既存VPCと重複しても作成可能
  enable_dns_support   = true          # AWSのDNSサーバによる名前解決を有効
  enable_dns_hostnames = true          # VPC内のリソースにパブリックDNSホスト名を自動的に割り当てる

  tags = {
    Name = var.resource_name
  }
}

####################################################
# Public Subnet
####################################################
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true              # 起動したインスタンスにパブリックIPを自動割当
  availability_zone       = "ap-northeast-1a" # AZ指定

  tags = {
    Name = var.resource_name
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
    Name = "${var.resource_name}-private-1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = aws_vpc.this.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "${var.resource_name}-private-1c"
  }
}

####################################################
# Internet Gateway
####################################################

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.resource_name
  }
}

####################################################
# Route Table Public
####################################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.resource_name
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
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
    Name = "${var.resource_name}-private-1a"
  }
}

####################################################
# Nat
####################################################
resource "aws_nat_gateway" "nat_1a" {
  subnet_id = aws_subnet.public.id
  allocation_id = aws_eip.nat_1a.id
  tags = {
    Name = "${var.resource_name}-natgw-1a"
  }
}

####################################################
# Elastic IP for nat
####################################################
resource "aws_eip" "nat_1a" {
  vpc = true
  tags = {
    Name = "${var.resource_name}-eip-for-natgw-1a"
  }
}