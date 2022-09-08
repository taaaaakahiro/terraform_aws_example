# get availability_zones list.
# For reference: availability_zone = data.aws_availability_zones.available.names[0]　
data "aws_availability_zones" "available" {
  state = "available"
}

# vpcの作成
resource "aws_vpc" "vpc" {
  # variable.tfで定義した"cidr_vpc"の値を参照
  cidr_block           = var.cidr_vpc
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.env}-${var.system}-vpc"
    Cost = "${var.system}"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-${var.system}-igw"
    Cost = "${var.system}"
  }
}

resource "aws_subnet" "public" {
  # lengthはterraformで用意された関数で配列の長さを返します
  count             = length(var.cidr_public)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.cidr_public, count.index)
 # azはdataブロックで取得した配列を参照します。
  availability_zone = data.aws_availability_zones.available.names[count.index % length(var.cidr_public)]
  tags = {
    Name = "${var.env}-${var.system}-pub-${count.index + 1}"
    Cost = "${var.system}"
  }
}

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

resource "aws_route_table_association" "public" {
  count          = length(var.cidr_public)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}