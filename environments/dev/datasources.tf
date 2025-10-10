data "grafana_data_source" "default_prometheus" {
  provider = grafana.stack
  # Domyślna nazwa to zazwyczaj "Prometheus".
  # Jeśli jest inna, musisz ją tutaj zmienić.
  name = "grafanacloud-adamssstfdev-prom"
}