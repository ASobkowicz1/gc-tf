# Twój jeden stack
resource "grafana_cloud_stack" "my_stack" {
  name               = "demo-stack"
  slug               = "demo-stack"
  region_slug        = "eu"
  delete_protection  = true
}

# Przykładowy folder w stacku
resource "grafana_folder" "my_folder" {
  title    = "Test Folder"
  depends_on = [grafana_cloud_stack.my_stack]
}