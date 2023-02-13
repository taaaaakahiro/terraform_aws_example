module "cloudfront" {
  source    = "../../modules/cloudfront"
  s3_main = module.s3.s3_main
  env       = local.env
  service   = local.service
  hosted_zone = local.hosted_zone
  acm_certificate_arn = module.web_front_dns.acm_certificate_cloudfront_arn
}

module "s3" {
  source  = "../../modules/s3"
  env     = local.env
  service = local.service
  cloudfront_distribution = module.cloudfront.cloudfront_distribution
}

module "web_front_dns" {
  source = "../../modules/web_front_dns"
  hosted_zone = local.hosted_zone
  cloudfront_distribution = module.cloudfront.cloudfront_distribution
}




