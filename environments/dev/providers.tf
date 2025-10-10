provider "grafana" {
  alias = "cloud"
  cloud_access_policy_token = var.grafana_cloud_token
}

provider "grafana" {
  alias = "stack"

  url  = grafana_cloud_stack.cloud.url
  auth = grafana_cloud_stack_service_account_token.terraform_admin.key
}