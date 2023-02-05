terraform {
  required_version = ">= 0.13"
  backend "s3" {
    bucket = "terraform-example-tkoide"
    key    = "dev/network/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = local.region
}