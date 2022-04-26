module "cdn" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "~>2.9"

  aliases                              = ["${var.domain}", "www.${var.domain}"]
  comment                              = random_pet.this.id
  enabled                              = true
  is_ipv6_enabled                      = true
  price_class                          = "PriceClass_100"
  retain_on_delete                     = false
  wait_for_deployment                  = false
  realtime_metrics_subscription_status = "Enabled"
  create_monitoring_subscription       = true
  create_origin_access_identity        = true
  web_acl_id                           = aws_wafv2_web_acl.waf_acl.arn

  origin_access_identities = {
    s3_bucket_one = "access-identity-${var.domain}.s3.us-east-2.amazonaws.com"
  }

  logging_config = {
    include_cookies = true
    bucket          = module.log_bucket.s3_bucket_bucket_domain_name
  }

  origin = {
    s3_one = {
      domain_name = module.s3_one.s3_bucket_bucket_regional_domain_name
      s3_origin_config = {
        origin_access_identity = "s3_bucket_one"
      }
    }
  }

  default_cache_behavior = {
    target_origin_id       = "s3_one"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true
  }

  viewer_certificate = {
    acm_certificate_arn      = module.acm.acm_certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}
