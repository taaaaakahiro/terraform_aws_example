terraform {
  required_version = ">= 0.13"
  backend "s3" {
    # bucket = "terraform-example-tkoide"
    bucket = "tak-terraform-example"
    key    = "dev/web_front/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = local.region
}

