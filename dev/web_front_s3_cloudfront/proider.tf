terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.29.0"
    }
  }
  backend "s3" {
    bucket = "tak-terraform-example"
    key    = "dev/web_front/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = {
      Environment = local.env
    }
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = local.env
    }
  }
}

