module "rds_aurora_mysql" {
    source           = "../../modules/rds_aurora"
    env              = local.env
    service          = local.service
    vpc_id = data.terraform_remote_state.init.outputs.vpc_id
    pri_subnet_db_1a = data.terraform_remote_state.init.outputs.pri_subnet_db_1a
    pri_subnet_db_1c = data.terraform_remote_state.init.outputs.pri_subnet_db_1c
    pri_subnet_db_1d = data.terraform_remote_state.init.outputs.pri_subnet_db_1d
}

module "bastion" {
    source               = "../../modules/bastion"
    env                  = local.env
    system               = local.system
    key_name             = aws_key_pair.this.key_name
    sg_bastion_ssh       = data.terraform_remote_state.init.outputs.aws_security_group_bation_id
    instance_cnt         = local.instance_cnt
    ami                  = local.ami
    type                 = local.type
    iam_instance_profile = module.iam.iam_instance_profile_name
    pub_subnet_1a        = data.terraform_remote_state.init.outputs.pub_subnet_1a
}

module "iam" {
  source      = "../../modules/iam"
  name        = local.system
  db_password = module.rds_aurora_mysql.rds_password
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