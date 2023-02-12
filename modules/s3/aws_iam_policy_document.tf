data "aws_iam_policy_document" "s3_main_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.main.arn}/*"]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values   = [var.aws_cloudfront_distribution.arn]
    }
  }

#   statement {
#     sid = "legacy"
#     principals {
#       type        = "AWS"
#       identifiers = [aws_cloudfront_origin_access_identity.legacy.iam_arn]
#     }
#     actions   = ["s3:GetObject"]
#     resources = ["${aws_s3_bucket.main.arn}/*"]
#   }
}

# resource "aws_cloudfront_origin_access_identity" "legacy" {}