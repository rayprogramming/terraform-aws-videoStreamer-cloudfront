resource "aws_ssm_parameter" "cdn_bucket" {
  name        = "/${var.name}/cdn/bucket"
  description = "The bucket name for the cdn"
  type        = "String"
  value       = module.s3_one.s3_bucket_id
}
resource "aws_ssm_parameter" "cdn_bucket_domain" {
  name        = "/${var.name}/cdn/domain"
  description = "The bucket domain name for the cdn"
  type        = "String"
  value       = module.s3_one.s3_bucket_bucket_domain_name
}
