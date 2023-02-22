locals {
  region         = "ap-northeast-1"
  service        = "demo"
  env            = "dev"
  vpc_cidr       = "10.0.0.0/16"
  // for alb
  cidr_pub_1a    = "10.0.1.0/24"
  cidr_pub_1c    = "10.0.2.0/24"
  cidr_pri_1a    = "10.0.3.0/24"
  cidr_pri_1c    = "10.0.4.0/24"
  // for rds
  cidr_pri_db_1a = "10.0.10.0/24"
  cidr_pri_db_1c = "10.0.11.0/24"
  cidr_pri_db_1d = "10.0.12.0/24"
}
