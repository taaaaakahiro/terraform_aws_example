output "acm_certificate" {
    value = aws_acm_certificate.this
}

output "acm_certificate_cloudfront_arn" {
    value = aws_acm_certificate.cloudfront_acm.arn
}


# output "acm_certificate_alb_arn" {
#     value = aws_acm_certificate.alb_acm.arn
# }