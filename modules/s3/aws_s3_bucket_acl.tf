resource "aws_s3_bucket_acl" "this" {
    bucket = aws_s3_bucket.main.id
    acl    = "private"
}