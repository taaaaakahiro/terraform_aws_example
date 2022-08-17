resource "aws_vpc" "demo_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "vpc_demo"
  }
}

resource "aws_subnet" "demo_public_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "demo_vpc_subnet"
  }
}

## praivate
resource "aws_subnet" "demo_private_db1" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "demo_private_db1"
  }
}

resource "aws_subnet" "demo_private_db2" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "192.168.3.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "demo_private_db2"
  }
}


# route table
resource "aws_route_table" "demo_public_route" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_gw.id
  }
  tags = {
    Name = "demo_public_route"
  }
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = aws_subnet.demo_public_subnet.id
  route_table_id = aws_route_table.demo_public_route.id
}

# internet gateway
resource "aws_internet_gateway" "demo_gw" {
  vpc_id     = aws_vpc.demo_vpc.id
  depends_on = [aws_vpc.demo_vpc]
  tags = {
    Name = "demo_gw"
  }
}
