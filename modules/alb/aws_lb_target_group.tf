resource "aws_lb_target_group" "alb_tg" {
  name        = "${var.env}-${var.service}-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}