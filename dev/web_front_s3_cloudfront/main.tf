module "cloudfront" {
  source = "../../modules/cloudfront"
  s3_bucket = module.s3.demo_s3
}

module "s3" {
  source = "../../modules/s3"
}

resource "aws_route53_zone" "this" {
  name = local.hosted_zone

#   lifecycle {
#     prevent_destroy = true
#   }
}

resource "aws_route53_record" "this" {
  name = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_name
  type = tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_type
  records = [
    tolist(aws_acm_certificate.this.domain_validation_options)[0].resource_record_value
  ]

  zone_id = aws_route53_zone.this.zone_id
  ttl     = 60
}

resource "aws_acm_certificate" "this" {
  domain_name       = "*.${local.hosted_zone}"
  validation_method = "DNS"

#   lifecycle {
#     create_before_destroy = true
#   }
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn = aws_acm_certificate.this.arn
  validation_record_fqdns = [
    aws_route53_record.this.fqdn
  ]
}
