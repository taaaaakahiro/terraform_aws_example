variable "instance_type" {
  default = "t2.micro"
}
variable "region" {
  default = "ap-northeast-1"
}
variable "system" {
  default =  "demo"
}
variable "env" {
  default = "dev"
}
variable "myip" {
  default = "0.0.0.0/0"
}
variable "instance_cnt" {
  default = 1
}
variable "ami" {
  default = "ami-0701e21c502689c31"
}
variable "type" {
  default = "t2.micro"
}
variable "key_name" {
  default = "demo-key"
}
