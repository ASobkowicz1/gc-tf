provider "grafana" {
  alias = "cloud"
  cloud_access_policy_token = var.grafana_cloud_token
}

#Stack creation
resource "grafana_cloud_stack" "dev" {
  provider    = grafana.cloud
  name        = "adamsss-tf-dev"
  slug        = "adamsss-tf-dev"
  region_slug = "prod-eu-west-2" # AWS Germany
  description = "DEV Terraform Grafana Stack"
}

#Service account for TF
resource "grafana_cloud_stack_service_account" "terraform_admin" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.dev.slug
  name       = "terraform-admin"
  role       = "Admin"
}

#Service account token
resource "grafana_cloud_stack_service_account_token" "terraform_admin" {
  provider           = grafana.cloud
  stack_slug         = grafana_cloud_stack.dev.slug
  service_account_id = grafana_cloud_stack_service_account.terraform_admin.id
  name               = "terraform-token"
}