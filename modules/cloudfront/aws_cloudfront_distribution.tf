resource "aws_cloudfront_distribution" "main" {
  enabled = true
  aliases             = ["front.${var.hosted_zone}"]
  http_version        = "http2"
  is_ipv6_enabled     = false
  web_acl_id          = null
  default_root_object = "index.html"

  origin {
    origin_id                = var.s3_main.bucket_regional_domain_name
    domain_name              = var.s3_main.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.main.id
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }

  default_cache_behavior {
    # target_origin_id       = var.s3_main.id
    viewer_protocol_policy = "redirect-to-https"
    target_origin_id       = var.s3_main.bucket_regional_domain_name
    cached_methods         = ["GET", "HEAD"]
    allowed_methods        = ["GET", "HEAD"]
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # viewer_certificate {
  #   cloudfront_default_certificate = true
  # }
}