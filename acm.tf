module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.4"
  providers = {
    aws = aws.east-1
  }

  domain_name               = var.domain
  zone_id                   = var.zone_id
  subject_alternative_names = ["www.${var.domain}"]
  wait_for_validation       = true
}
