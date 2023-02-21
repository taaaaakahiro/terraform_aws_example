resource "aws_ecs_service" "this" {
  name            = "${var.env}-${var.service}-ecs-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count       = 2
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"
  health_check_grace_period_seconds = 60


  network_configuration {
    assign_public_ip = false
    security_groups  = [var.sg_alb_id]
    subnets          = [
      var.subnet_container_1a,
      var.subnet_container_1c,
    ]
  }

  load_balancer {
    target_group_arn = var.alb_tg_arn
    container_name   = "${var.env}-app"
    container_port   = 80
  }
}