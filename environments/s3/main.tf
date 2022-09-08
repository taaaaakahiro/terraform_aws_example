terraform {
  required_version = ">= 0.11"
  backend "s3" {
    bucket = "terraform-example-tkoide"
    key    = "s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}