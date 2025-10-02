# Grafana Cloud Infrastructure with Terraform

This repo provisions Grafana Cloud stacks and resources via Terraform.

## Workflow
- Create feature branch → add/change Terraform code
- Open PR → GitHub Actions runs `terraform plan`
- Merge to main → GitHub Actions runs `terraform apply`

## Secrets
- `GRAFANA_CLOUD_TOKEN` must be configured in GitHub repo settings (Settings → Secrets and variables → Actions).