
//cloudfront
resource "aws_cloudfront_distribution" "main" {
  enabled = true

  # オリジンの設定
  origin {
    origin_id   = var.s3_bucket.id
    domain_name = var.s3_bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.main.id
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    target_origin_id       = var.s3_bucket.id
    viewer_protocol_policy = "redirect-to-https"
    cached_methods         = ["GET", "HEAD"]
    allowed_methods        = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      headers      = []
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

# OAI を作成
resource "aws_cloudfront_origin_access_control" "main" {
  name                              = "demo-cloudfront-origin-access-contorl"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
