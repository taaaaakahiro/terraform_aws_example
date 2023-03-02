resource "aws_lb" "this" {
  name               = "${var.env}-${var.service}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_elb]
  subnets            = [
    var.pub_subnet_alb_1a,
    var.pub_subnet_alb_1c,
  ]

  tags = {
    Name = "${var.env}-${var.service}-alb"
    Cost = "${var.service}"
  }
}


