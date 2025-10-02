provider "grafana" {
  alias = "cloud"
  cloud_access_policy_token = var.grafana_cloud_token
}