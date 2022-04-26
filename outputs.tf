output "name" {
  value = var.name
}

output "fqdn" {
  value = module.records.route53_record_fqdn
}
