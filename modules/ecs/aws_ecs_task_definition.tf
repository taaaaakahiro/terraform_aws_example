resource "aws_ecs_task_definition" "this" {
  family                   = "${var.env}-${var.service}-ecs-task-definition"
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${var.account_id}:role/ecsTaskExecutionRole"
  container_definitions    = var.container_definition_file

}