//s3
# CloudFront 経由で配信する S3 バケット
resource "aws_s3_bucket" "main" {
  bucket = "20220917-demo-cloudfront-s3"
}