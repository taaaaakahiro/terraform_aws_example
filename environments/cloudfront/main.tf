terraform {
  required_version = ">= 0.11"
  backend "s3" {
    bucket = "terraform-example-tkoide"
    key    = "cloudfront/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  default = "ap-northeast-1"
}
