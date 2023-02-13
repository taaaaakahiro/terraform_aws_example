resource "aws_route53_record" "this" {
  name = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_name
  type = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_type
  records = [
    tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_value
  ]

  zone_id = aws_route53_zone.this.zone_id
  ttl     = 60
}

resource "aws_route53_record" "cloud_front" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.hosted_zone
  type    = "A"
  alias {
    name                   = var.cloudfront_distribution.domain_name
    zone_id                = var.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}