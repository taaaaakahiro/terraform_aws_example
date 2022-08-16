resource "aws_vpc" "demo_vpc" {
  cidr_block = "192.168.1.0/24"
  tags = {
    Name = "vpc_demo"
  }
}

resource "aws_subnet" "demo_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "vpc_subnet_demo"
  }
}
