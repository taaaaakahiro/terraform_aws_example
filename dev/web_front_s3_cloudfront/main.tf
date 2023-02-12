module "cloudfront" {
  source    = "../../modules/cloudfront"
  s3_main = module.s3.s3_main
  env       = local.env
  service   = local.service
}

module "s3" {
  source  = "../../modules/s3"
  env     = local.env
  service = local.service
  aws_cloudfront_distribution = module.cloudfront.aws_cloudfront_distribution
}

module "web_front_dns" {
  source = "../../modules/web_front_dns"
  hosted_zone = local.hosted_zone
}




