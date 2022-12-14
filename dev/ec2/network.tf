# VPC
resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16" # 値が既存VPCと重複しても作成可能
  enable_dns_support   = true          # AWSのDNSサーバによる名前解決を有効
  enable_dns_hostnames = true          # VPC内のリソースにパブリックDNSホスト名を自動的に割り当てる

  tags = {
    Name = var.resource_name
  }
}

# サブネット
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true              # 起動したインスタンスにパブリックIPを自動割当
  availability_zone       = "ap-northeast-1a" # AZ指定

  tags = {
    Name = var.resource_name
  }
}

# インターネットゲートウェイ
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.resource_name
  }
}

# ルートテーブル
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = var.resource_name
  }
}

# ルートテーブルのエントリ
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
}

# サブネットとルートテーブルの関連付け
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}