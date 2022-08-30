resource "aws_s3_bucket" "demo_s3" {
  bucket = "my-tf-test-bucket-tkoide"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
