resource "aws_route53_record" "this" {
  name    = tolist(var.acm_certificate.domain_validation_options)[0].resource_record_name
  type    = tolist(var.acm_certificate.domain_validation_options)[0].resource_record_type
  records = [
    tolist(var.acm_certificate.domain_validation_options)[0].resource_record_value
  ]

  zone_id = aws_route53_zone.this.zone_id
  ttl     = 60
}

resource "aws_route53_record" "cloud_front" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "front.${var.hosted_zone}"
  type    = "A"
  alias {
    name                   = var.cloudfront_distribution.domain_name
    zone_id                = var.cloudfront_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}