
# --------------------------------------------------------------
# Subnet  パブリック
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

# --------------------------------------------------------------
# Subnet  プライベート用
# --------------------------------------------------------------
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
# Subnet  database
# --------------------------------------------------------------
resource "aws_subnet" "pri_subnet_db_1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_private_db_1a
    availability_zone = "ap-northeast-1a"
    tags = {
      Name = "private_subnet_db_1a"
    }
}

resource "aws_subnet" "pri_subnet_db_1c" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.cidr_private_db_1c
    availability_zone = "ap-northeast-1c"
    tags = {
      Name = "private_subnet_db_1c"
    }
}