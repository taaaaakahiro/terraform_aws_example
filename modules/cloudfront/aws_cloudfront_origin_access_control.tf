# OAI を作成
resource "aws_cloudfront_origin_access_control" "main" {
  name                              = "demo-cloudfront-origin-access-contorl"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}