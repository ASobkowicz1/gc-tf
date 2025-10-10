data "grafana_data_source" "default_prometheus" {
  provider = grafana.stack
  name = "adamssstfdev-prom"
}