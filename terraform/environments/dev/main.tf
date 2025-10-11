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

#SAML authentication
resource "grafana_sso_settings" "saml_sso_settings" {
  provider = grafana.stack
  provider_name = "saml"
  saml_settings {
    name = "Auth0 SAML"
    allow_sign_up             = true
    auto_login                = true
    idp_metadata_url          = "${var.saml_idp_metadata_url}"
    assertion_attribute_login = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
    assertion_attribute_email = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
    assertion_attribute_name  = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
    assertion_attribute_groups= "https://dev-ia8t0x2zbbtsz63o.eu.auth0.com/roles"
    assertion_attribute_role  = "https://dev-ia8t0x2zbbtsz63o.eu.auth0.com/roles"
    role_values_editor        = "editor"
    role_values_admin         = "admin"
  }
}

