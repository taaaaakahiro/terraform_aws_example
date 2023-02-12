resource "aws_route53_zone" "this" {
  name = var.hosted_zone

#   lifecycle {
#     prevent_destroy = true
#   }
}