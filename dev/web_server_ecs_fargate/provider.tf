terraform {
  required_version = ">= 0.11"
  backend "s3" {
    bucket = "tak-terraform-example"
    key    = "dev/web_server/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = local.region
}