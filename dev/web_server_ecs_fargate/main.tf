module "ecs" {
  source = "../../modules/ecs"
  env = var.env
  pub_subnet_web1 = data.terraform_remote_state.demo.outputs.pub_subnet_web1
}

terraform {
  required_version = ">= 0.11"
  backend "s3" {
    bucket = "terraform-example-tkoide"
    key    = "ecr/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = var.region
}

variable "region" {
  default = "ap-northeast-1"
}
