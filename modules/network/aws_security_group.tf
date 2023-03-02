
#--------------------------------------------------------------
# Security group bation
#--------------------------------------------------------------
resource "aws_security_group" "bation" {
  name = "${var.service}-ec2-sg"

  description = "EC2 service security group for ${var.service}"
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = { for i in var.ingress_config : i.port => i }

    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "ingress_config" {
  type = list(object({
    port        = string
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 3306
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    },
     {
      port        = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  ]
  description = "list of ingress config"
}

#--------------------------------------------------------------
# Security group alb
#--------------------------------------------------------------
resource "aws_security_group" "alb" {
  name        = "${var.env}-sg-alb"
  description = "sg alb"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "my ip"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-sg-alb"
  }
}

#--------------------------------------------------------------
# Security group container
#--------------------------------------------------------------
resource "aws_security_group" "container" {
  name        = "${var.env}-sg-container"
  description = "sg container"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "alb sg"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description     = "alb sg"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-sg-container"
  }
}

#--------------------------------------------------------------
# Security group vpc_endpoint
#--------------------------------------------------------------
resource "aws_security_group" "vpce" {
  name        = "${var.env}-sg-vpce"
  description = "sg vpce"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "container sg"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.container.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-sg-vpce"
  }
}