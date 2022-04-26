variable "name" {
  type        = string
  description = "Name of project"
}
variable "domain" {
  type        = string
  description = "The domain name to use"
}
variable "zone_id" {
  type        = string
  description = "the zone_id to create the domain under"
}
