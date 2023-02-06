module "iam" {
  source = "../../modules/iam"
  name = local.system
  db_password = module.rds.rds_password
}

module "ec2" {
  source        = "../../modules/ec2"
  system        = local.system
  env           = local.env
  vpc_id        = data.terraform_remote_state.network.outputs.vpc_id
  subnet_id     = data.terraform_remote_state.network.outputs.pub_subnet_1a
  myip          = local.myip
  instance_cnt  = local.instance_cnt
  ami           = local.ami
  type          = local.instance_type
  key_name      = aws_key_pair.this.key_name
  iam_instance_profile = module.iam.iam_instance_profile_name
}

module "rds" {
  source        = "../../modules/rds"
  system        = local.system
  env           = local.env
  vpc_id        = data.terraform_remote_state.network.outputs.vpc_id
  pri_subnet_1a = data.terraform_remote_state.network.outputs.pri_subnet_1a
  pri_subnet_1c = data.terraform_remote_state.network.outputs.pri_subnet_1c
}

#--------------------------------------------------------------
# Key Pair
#--------------------------------------------------------------
resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file("${var.key_name}.pub")
}

variable "key_name" {
  type    = string
  default = "ec2_key"
}
variable "resource_name" {
  type    = string
  default = "sample1"
}




