# --------------------------------------------------------------
# Internet Gateway
# --------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.env}-${var.service}-igw"
    Cost = "${var.service}"
  }
}