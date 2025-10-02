resource "grafana_cloud_stack" "my_stack" {
  provider              = grafana.cloud
  name                  = "adamssstf2"
  slug                  = "adamssstf2"
  region_slug           = "eu"
  delete_protection     = true
}

// Step 2: Create a service account and key for the stack
resource "grafana_cloud_stack_service_account" "cloud_sa" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.my_stack.slug
  depends_on = grafana_cloud_stack.my_stack
  name        = "sa_tf2"
  role        = "Admin"
  is_disabled = false
}

resource "grafana_cloud_stack_service_account_token" "cloud_sa" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.my_stack.slug
  depends_on = grafana_cloud_stack_service_account.cloud_sa
  name               = "terraform serviceaccount key"
  service_account_id = grafana_cloud_stack_service_account.cloud_sa.id
}

// Step 3: Create resources within the stack
provider "grafana" {
  alias = "my_stack"

  url  = grafana_cloud_stack.my_stack.url
  auth = grafana_cloud_stack_service_account_token.cloud_sa.key
}
resource "grafana_folder" "my_folder" {
  provider = grafana.my_stack
  depends_on = grafana_cloud_stack_service_account_token.cloud_sa 
  title = "Test Folder"
}