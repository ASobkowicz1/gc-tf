resource "grafana_team" "team_x" {
  provider = grafana.stack
  name     = "Team X"
}

resource "grafana_data_source_permission" "prometheus_for_viewers" {
  provider       = grafana.stack
  datasource_uid = data.grafana_data_source.default_prometheus.id
  
  permissions {
    team_id    = grafana_team.team_x.id
    permission = "Query"
  }
}