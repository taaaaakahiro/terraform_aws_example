
#--------------------------------------------------------------
# Security group
#--------------------------------------------------------------
resource "aws_security_group" "bation" {
  name = "${var.system}-ec2-sg"

  description = "EC2 service security group for ${var.system}"
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