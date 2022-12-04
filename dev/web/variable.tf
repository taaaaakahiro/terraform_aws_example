locals {
  region = "ap-northeast-1"
  instance_type = "t2.micro"
  system = "terraform-example"
  env = "dev"
  myip = "0.0.0.0/0"
  instance_cnt = 1
  ami = "ami-02892a4ea9bfa2192"
  key_name = "demo-key"
}
