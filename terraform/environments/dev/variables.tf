variable "grafana_cloud_token" {
  description = "Grafana Cloud API token"
  type        = string
  sensitive   = true
}

variable "saml_idp_metadata_url" {
  description = "URL for IdP metadata"
  type        = string
  sensitive   = true
}
