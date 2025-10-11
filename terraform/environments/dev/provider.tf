terraform {
  cloud {
    organization = "AdamsssTF"
    
    workspaces {
      name = "gc-tf"
    }
  }
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 4.10.0"
    }
  }
}

provider "grafana" {
  alias = "cloud"
  cloud_access_policy_token = var.grafana_cloud_token
}

provider "grafana" {
  alias = "stack"

  url  = grafana_cloud_stack.dev.url
  auth = grafana_cloud_stack_service_account_token.terraform_admin.key
}