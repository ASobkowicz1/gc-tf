variable "grafana_cloud_token" {
  description = "Grafana Cloud API token"
  type        = string
  sensitive   = true
}

variable "oauth_url" {
  description = "AuthO provider URL for authorization"
  type        = string
  sensitive   = true
}

variable "oauth_client_id" {
  description = "AuthO Client ID for authorization"
  type        = string
  sensitive   = true
}

variable "oauth_client_secret" {
  description = "AuthO Client secret for authorization"
  type        = string
  sensitive   = true
}