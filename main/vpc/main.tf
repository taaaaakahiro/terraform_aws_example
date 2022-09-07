terraform {
  required_version = ">= 0.11"
  backend "s3" {
    bucket = "terraform-example-tkoide"
    key    = "vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = var.region
}