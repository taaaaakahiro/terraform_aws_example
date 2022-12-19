variable "region" {
    default = "ap-northeast-1"
}

# 鍵の名前
# 秘密鍵のファイル名に相当する名前
variable "key_name" {
  type    = string
  default = "ec2_key"
}

# リソース名
# 簡単のため全リソースでここで設定した共通の名前を使用する
variable "resource_name" {
  type    = string
  default = "sample1"
}

locals {
   ssm_parameter_store_base = "/zenn/prod"
}
