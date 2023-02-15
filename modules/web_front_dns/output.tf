output "acm_certificate_cloudfront_arn" {
    value = aws_acm_certificate.cloudfront_acm.arn
}

output "acm_certificate_arn" {
    value = aws_acm_certificate.this.arn
}