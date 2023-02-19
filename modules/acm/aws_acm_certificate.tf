resource "aws_acm_certificate" "this" {
  domain_name       = "*.${var.hosted_zone}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate" "cloudfront_acm" {
  domain_name       = "*.${var.hosted_zone}"
  validation_method = "DNS"
  provider          = aws.us-east-1
  lifecycle {
    create_before_destroy = true
  }
}

