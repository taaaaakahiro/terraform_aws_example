output "zone_id" {
    value = module.route53.aws_route53_record.zone_id
}

output "acm_certificate_alb_arn" {
    value = module.acm.acm_certificate_alb_arn
}

output "acm_certificate_cloudfront_arn" {
    value = module.acm.acm_certificate_cloudfront_arn
}

output "acm_certificate_arn" {
    value = module.acm.acm_certificate.arn
}