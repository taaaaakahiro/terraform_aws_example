//s3
# CloudFront 経由で配信する S3 バケット
resource "aws_s3_bucket" "main" {
  bucket = "20220917-demo-cloudfront-s3"
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# // バケット
# resource "aws_s3_bucket" "main" {
#   bucket = "cf-oac-with-tf-example"
# }

# # バケットポリシー
# resource "aws_s3_bucket_policy" "main" {
#   bucket = aws_s3_bucket.main.id
#   policy = data.aws_iam_policy_document.s3_main_policy.json
# }

# data "aws_iam_policy_document" "s3_main_policy" {
#   # OAI からのアクセスのみ許可
#   statement {
#     principals {
#       type        = "Service"
#       identifiers = ["cloudfront.amazonaws.com"]
#       # Regacy
#       # type        = "AWS"
#       # identifiers = [aws_cloudfront_origin_access_identity.main.iam_arn]
#     }
#     actions   = ["s3:GetObject"]
#     resources = ["${aws_s3_bucket.main.arn}/*"]
#     condition {
#       test     = "StringEquals"
#       variable = "aws:SourceArn"
#       values   = [aws_cloudfront_distribution.main.arn]
#     }
#   }
# }