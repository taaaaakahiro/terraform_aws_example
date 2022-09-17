# //s3
# # CloudFront 経由で配信する S3 バケット
# resource "aws_s3_bucket" "main" {
#   bucket = "demo-s3"
# }

# resource "aws_s3_bucket_public_access_block" "main" {
#   bucket                  = aws_s3_bucket.main.id
#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }