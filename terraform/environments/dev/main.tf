#Stack creation
resource "grafana_cloud_stack" "dev" {
  provider    = grafana.cloud
  name        = "adamssstfdev1"
  slug        = "adamssstfdev1"
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

#OAuth authentication
resource "grafana_sso_settings" "generic_sso_settings" {
  provider = grafana.stack
  provider_name = "generic_oauth"
  oauth2_settings {
    name              = "Auth0"
    auth_url          = "https://${var.oauth_url}/authorize"
    token_url         = "https://${var.oauth_url}/oauth/token"
    api_url           = "https://${var.oauth_url}/userinfo"
    client_id         = var.oauth_client_id
    client_secret     = var.oauth_client_secret
    allow_sign_up     = true
    auto_login        = false
    scopes            = "openid profile email offline_access"
    use_pkce          = true
    use_refresh_token = true
  }
}

#USERS AND TEAMS
resource "grafana_team" "team_devops" {
  provider = grafana.stack
  name     = "DevOps"
}

resource "grafana_team" "team_network" {
  provider = grafana.stack
  name     = "Network"
}

#FOLDERS
resource "grafana_folder" "team_devops" {
  provider = grafana.stack
  title    = "DevOps Team"
}

resource "grafana_folder" "team_network" {
  provider = grafana.stack
  title    = "Network Team"
}

