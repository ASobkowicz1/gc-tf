resource "grafana_folder" "team_x" {
  provider = grafana.stack
  title    = "Team X folder"
}
/*
resource "grafana_dashboard" "test_dash_1" {
  provider      = grafana.stack
  folder        = grafana_folder.team_x.uid
  config_json   = file("${path.module}/../../dashboards/dev/10991_rev15.json")
  overwrite     = true
}
*/