resource "grafana_data_source" "prometheus_cloud" {
  provider = grafana.stack
  
  type          = "prometheus"
  name          = "Grafana Cloud Prometheus"
  url           = grafana_cloud_stack.dev.prometheus_url
  is_default    = true
  access_mode   = "proxy"
  
  basic_auth_enabled = true
  basic_auth_username = grafana_cloud_stack.dev.prometheus_user_id
  
  secure_json_data_encoded = jsonencode({
    basicAuthPassword = grafana_cloud_stack.dev.prometheus_api_key
  })
}