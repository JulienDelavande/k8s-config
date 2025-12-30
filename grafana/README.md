# Grafana

Grafana deployment with Prometheus datasource and auto-provisioned dashboards via sidecar.

## Structure

```
grafana/
├── dashboards/              # Dashboard JSON files
├── deploy-dashboards.sh     # Deploy dashboards as ConfigMaps
├── grafana-values.yaml      # Helm values
├── grafana-ingress.yaml     # Traefik ingress
└── sealed-grafana-admin.yaml # Admin credentials (sealed secret)
```

## Install / Upgrade

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm upgrade --install grafana grafana/grafana -n monitoring -f grafana/grafana-values.yaml
```

## Deploy Dashboards

Dashboards are loaded automatically via sidecar from ConfigMaps with label `grafana_dashboard=1`. When adding a new dashboard run:

```bash
./deploy-dashboards.sh
```

## Access

- URL: https://grafana.delavande.fr
- User: `admin`
- Password: `kubectl get secret -n monitoring grafana-admin-secret -o jsonpath='{.data.admin-password}' | base64 -d`