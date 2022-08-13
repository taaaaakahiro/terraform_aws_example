resource "aws_vpc" "demo" {
  cidr_block = "192.168.1.0/24"

  tags = {
    name = "vpc_demo"
  }
}
