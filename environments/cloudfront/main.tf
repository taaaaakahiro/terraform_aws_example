module "cloudfront" {
  source = "../../modules/cloudfront"
  s3_bucket = module.s3.demo_s3
}

module "s3" {
  source = "../../modules/s3"
}