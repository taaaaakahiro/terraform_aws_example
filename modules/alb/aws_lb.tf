resource "aws_lb" "alb" {
  name               = "${var.env}-${var.service}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_elb]
  subnets            = [
    var.pub_subnet_alb_1a,
    var.pub_subnet_alb_1c,
  ]
  enable_deletion_protection = false

  tags = {
    Name = "${var.env}-${var.service}-alb"
    Cost = "${var.service}"
  }
}


