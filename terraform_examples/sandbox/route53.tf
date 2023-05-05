#######################################################
#  ROUTE53 
#######################################################

#Web Console
resource "aws_route53_record" "webconsole" {
  zone_id = data.aws_route53_zone.sub_domain.zone_id
  name    = "webconsole-${random_string.releasename.result}.${local.internal_domain}"
  type    = "A"

  alias {
    name                   = "dualstack.${data.aws_lb.main.dns_name}"
    zone_id                = data.aws_lb.main.zone_id
    evaluate_target_health = true
  }
}

