resource "aws_ecs_cluster" "this" {
  name = "${var.env}-${var.service}-ecs-cluster"
  tags = {
    Name = "${var.env}-ecs"
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}