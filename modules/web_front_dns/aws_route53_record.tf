resource "aws_route53_record" "this" {
  name    = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_type
  records = [
    tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_value
  ]

  zone_id = aws_route53_zone.this.zone_id
  ttl     = 60
}