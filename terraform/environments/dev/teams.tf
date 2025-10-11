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