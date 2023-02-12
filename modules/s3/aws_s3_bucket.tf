# CloudFront 経由で配信する S3 バケット
resource "aws_s3_bucket" "main" {
  bucket_prefix = "${var.service}-${var.env}-web-front-s3"
  force_destroy = true
}

resource "aws_s3_object" "hello_txt" {
  bucket  = aws_s3_bucket.main.id
  key     = "hello.txt"
  content = "hello world"
}

