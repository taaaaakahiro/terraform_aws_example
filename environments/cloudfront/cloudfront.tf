
//cloudfront
resource "aws_cloudfront_distribution" "main" {
  enabled = true

  # オリジンの設定
  origin {
    origin_id   = aws_s3_bucket.main.id
    domain_name = aws_s3_bucket.main.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.main.id
    # OAI を設定
    # Regacy
    # s3_origin_config {
    #   origin_access_identity = aws_cloudfront_origin_access_identity.main.cloudfront_access_identity_path
    # }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  default_cache_behavior {
    target_origin_id       = aws_s3_bucket.main.id
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
  name                              = "cf-oac-with-tf-example"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
# Regacy
# resource "aws_cloudfront_origin_access_identity" "main" {}

//s3
# CloudFront 経由で配信する S3 バケット
resource "aws_s3_bucket" "main" {
  bucket = "cf-oac-with-tf-example"
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}