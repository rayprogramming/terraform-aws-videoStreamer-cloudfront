data "aws_route53_zone" "selected" {
  zone_id = var.zone_id
}
module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~>2.0.0" # https://github.com/terraform-aws-modules/terraform-aws-route53/issues/59
  providers = {
    aws = aws.east-1
  }

  zone_id = data.aws_route53_zone.selected.zone_id

  records = [
    {
      name = ""
      type = "A"
      alias = {
        name    = module.cdn.cloudfront_distribution_domain_name
        zone_id = module.cdn.cloudfront_distribution_hosted_zone_id
      }
    },
    {
      name = "www"
      type = "A"
      alias = {
        name    = module.cdn.cloudfront_distribution_domain_name
        zone_id = module.cdn.cloudfront_distribution_hosted_zone_id
      }
    },
  ]
}
