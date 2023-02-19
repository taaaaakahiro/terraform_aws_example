module "cloudfront" {
  source              = "../../modules/cloudfront"
  s3_main             = module.s3.s3_main
  env                 = local.env
  service             = local.service
  hosted_zone         = local.hosted_zone
  acm_certificate_arn = module.acm.acm_certificate_cloudfront_arn
}

module "s3" {
  source                  = "../../modules/s3"
  env                     = local.env
  service                 = local.service
  cloudfront_distribution = module.cloudfront.cloudfront_distribution
}

module "acm" {
  source             = "../../modules/acm"
  env                = local.env
  service            = local.service
  hosted_zone        = local.hosted_zone
  aws_route53_record = module.route53.aws_route53_record
}

module "route53" {
  source                         = "../../modules/route53"
  hosted_zone                    = local.hosted_zone
  cloudfront_distribution        = module.cloudfront.cloudfront_distribution
  acm_certificate_cloudfront_arn = module.acm.acm_certificate_cloudfront_arn
  acm_certificate                = module.acm.acm_certificate
}




