variable "region" {
  default = "ap-northeast-1"
}
variable "system" {
    default = "demo"
}
variable "env" {
    default = "dev"
}
# vpc cidir
variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
# subnet pubric
variable "cidr_public_1a" {
    default = "10.0.1.0/24"
}
variable "cidr_public_1c" {
    default = "10.0.2.0/24"
}
# subnet private
variable "cidr_private_1a" {
    default = "10.0.10.0/24"
}
variable "cidr_private_1c" {
    default = "10.0.11.0/24"
}