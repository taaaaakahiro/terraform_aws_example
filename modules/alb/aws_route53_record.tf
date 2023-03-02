resource "aws_route53_record" "this" {
  zone_id = var.zone_id
  name    = "api.tkoi.link"
  type    = "CNAME"
  ttl     = 60
  records = [aws_lb.this.dns_name]
}