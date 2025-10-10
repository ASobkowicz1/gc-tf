resource "grafana_data_source" "prometheus_cloud" {
  provider = grafana.stack
  
  type          = "prometheus"
  name          = "Grafana Cloud Prometheus"
  url           = grafana_cloud_stack.dev.prometheus_url
  is_default    = true
  access_mode   = "proxy"
  
  basic_auth_enabled = true
  basic_auth_username = grafana_cloud_stack.dev.prometheus_user_id
  
  sensitive_json_data {
    basic_auth_password = grafana_cloud_stack.dev.prometheus_api_key
  }
}