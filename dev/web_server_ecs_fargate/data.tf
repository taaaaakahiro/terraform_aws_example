data "terraform_remote_state" "web_front" {
  backend = "s3"
 
  config = {
   bucket = "tak-terraform-example"
    key    = "dev/web_front/terraform.tfstate"
    region = "ap-northeast-1"
  }
}