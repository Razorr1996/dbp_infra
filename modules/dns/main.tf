locals {
  env_domain = "${var.environment}.${var.domain}"
}

data "aws_route53_zone" "zone" {
  name = var.domain
}

resource "aws_route53_record" "environment" {
  name    = local.env_domain
  type    = "A"
  zone_id = data.aws_route53_zone.zone.id

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
