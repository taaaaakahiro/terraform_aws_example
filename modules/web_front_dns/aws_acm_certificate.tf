resource "aws_acm_certificate" "this" {
  domain_name       = "*.${var.hosted_zone}"
  validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
}