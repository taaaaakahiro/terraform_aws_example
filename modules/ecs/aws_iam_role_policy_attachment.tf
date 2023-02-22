# # aws_iam_role_policy_attachment.tf

# resource "aws_iam_role_policy_attachment" "task_policy_attachment" {
#   role       = aws_iam_role.task_role.name
#   policy_arn = data.aws_iam_policy.AmazonECSTaskExecutionRolePolicy.arn
# }