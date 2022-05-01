module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.4"
  providers = {
    aws = aws.east-1
  }

  domain_name               = var.domain != "" ? "${var.domain}.${data.aws_route53_zone.selected.name}" : data.aws_route53_zone.selected.name
  zone_id                   = data.aws_route53_zone.selected.zone_id
  subject_alternative_names = var.domain != "" ? ["www.${var.domain}.${data.aws_route53_zone.selected.name}"] : ["www.${data.aws_route53_zone.selected.name}"]
  wait_for_validation       = true
}
