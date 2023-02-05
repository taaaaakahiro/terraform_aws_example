data "terraform_remote_state" "demo" {
  backend = "s3"
 
  config = {
    bucket = "terraform-example-tkoide"
    key    = "dev/network/terraform.tfstate"
    region = "ap-northeast-1"
  }
}