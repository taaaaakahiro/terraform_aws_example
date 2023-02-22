
# --------------------------------------------------------------
# Route Table Public
# --------------------------------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.env}-${var.service}-pub-rt"
    Cost = "${var.service}"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# --------------------------------------------------------------
# Route Table Private
# --------------------------------------------------------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-${var.service}-pub-rt"
    Cost = "${var.service}"
  }
}

resource "aws_route_table" "private_db" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-${var.service}-pub-rt-db"
    Cost = "${var.service}"
  }
}


# --------------------------------------------------------------
# Route Table Association Public
# --------------------------------------------------------------
resource "aws_route_table_association" "public_route_table_1a" {
  subnet_id      = aws_subnet.pub_subnet_1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_route_table_1c" {
  subnet_id      = aws_subnet.pub_subnet_1c.id
  route_table_id = aws_route_table.public.id
}


# --------------------------------------------------------------
# Route Table Association Private
# --------------------------------------------------------------
resource "aws_route_table_association" "private_route_table_1a" {
  subnet_id      = aws_subnet.pri_subnet_1a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private_route_table_1c" {
  subnet_id      = aws_subnet.pri_subnet_1c.id
  route_table_id = aws_route_table.private.id
}

# --------------------------------------------------------------
# Route Table Association Private Database
# --------------------------------------------------------------
resource "aws_route_table_association" "private_route_table_db_1a" {
  subnet_id      = aws_subnet.pri_subnet_db_1a.id
  route_table_id = aws_route_table.private_db.id
}
resource "aws_route_table_association" "private_route_table_db_1c" {
  subnet_id      = aws_subnet.pri_subnet_db_1c.id
  route_table_id = aws_route_table.private_db.id
}
resource "aws_route_table_association" "private_route_table_db_1d" {
  subnet_id      = aws_subnet.pri_subnet_db_1d.id
  route_table_id = aws_route_table.private_db.id
}