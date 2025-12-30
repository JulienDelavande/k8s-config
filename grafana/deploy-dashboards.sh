#!/bin/bash
# Script pour déployer les dashboards Grafana
# Génère des ConfigMaps avec le label grafana_dashboard=1

NAMESPACE="monitoring"
DASHBOARD_DIR="$(dirname "$0")/dashboards"

for file in "$DASHBOARD_DIR"/*.json; do
  filename=$(basename "$file" .json)
  echo "Deploying dashboard: $filename"
  
  kubectl create configmap "grafana-dashboard-${filename}" \
    --namespace="$NAMESPACE" \
    --from-file="${filename}.json=${file}" \
    --dry-run=client -o yaml | \
  kubectl label --local -f - grafana_dashboard=1 -o yaml | \
  kubectl annotate --local -f - grafana_folder=Kubernetes -o yaml | \
  kubectl apply -f -
done

echo "Done! Dashboards deployed."
