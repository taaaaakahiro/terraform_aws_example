resource "aws_vpc" "demo_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "vpc_demo"
  }
}
# public subnet
resource "aws_subnet" "demo_public_subnet" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "192.168.1.0/24"

  tags = {
    Name = "demo_vpc_subnet"
  }
}

## praivate subnet
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

resource "aws_route_table_association" "demo_public_a" {
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

# Security Group
resource "aws_security_group" "demo_public_web_sg" {
    name = "public-web-sg"
    vpc_id = aws_vpc.demo_vpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "demo_public_web_sg"
    }
}

resource "aws_security_group" "demo_praivate_db_sg" {
    name = "praivate-db-sg"
    vpc_id = aws_vpc.demo_vpc.id
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["10.0.1.0/24"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "demo_praivate_db_sg"
    }
}
