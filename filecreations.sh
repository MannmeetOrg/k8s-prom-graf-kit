#!/bin/bash

# crds/podmonitors/
touch crds/podmonitors/app-podmonitor.yaml

# crds/prometheusrules/
touch crds/prometheusrules/general-alerts.yaml
touch crds/prometheusrules/custom-metrics-rules.yaml

# crds/servicemonitors/
touch crds/servicemonitors/kubelet-servicemonitor.yaml
touch crds/servicemonitors/app-servicemonitor.yaml

# grafana/provisioning/alerting/
touch grafana/provisioning/alerting/alert-group-default.yaml

# grafana/provisioning/dashboards/
touch grafana/provisioning/dashboards/kubernetes-overview.json
touch grafana/provisioning/dashboards/pod-health.json

# grafana/provisioning/datasources/
touch grafana/provisioning/datasources/prometheus-datasource.yaml

# helm/values/
touch helm/values/monitoring.yaml

# k8s/ingress/
touch k8s/ingress/grafana-ingress.yaml
touch k8s/ingress/alertmanager-ingress.yaml

# scripts/
touch scripts/prometheus-snapshot.sh
touch scripts/backup-grafana.sh
touch scripts/validate-rules.sh

# terraform/
touch terraform/main.tf
touch terraform/variables.tf

# .github/workflows/
touch .github/workflows/ci.yaml
touch .github/workflows/lint.yaml

echo "All specified files created inside their respective directories."
