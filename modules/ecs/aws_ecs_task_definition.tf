resource "aws_ecs_task_definition" "this" {
  family                   = "${var.env}-${var.service}-ecs-task-definition"
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task_role.arn
  execution_role_arn       = aws_iam_role.execution_role.arn
  container_definitions    = var.container_definition_file

}