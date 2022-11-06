resource "aws_ecs_service" "this" {
  name            = "golang-ecs-fargate"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 3


  network_configuration {
    subnets          = [var.pub_subnet_web1]
    # security_groups  = [aws_security_group.fargate_service.id]
    assign_public_ip = true
  }
}