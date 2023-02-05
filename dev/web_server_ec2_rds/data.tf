data "terraform_remote_state" "network" {
  backend = "s3"
 
  config = {
    bucket = "terraform-example-tkoide"
    key    = "dev/network/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

