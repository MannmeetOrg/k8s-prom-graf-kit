#!/bin/bash
# Backup Grafana SQLite DB or Export dashboards via API

GRAFANA_POD=$(kubectl get pods -n monitoring -l app.kubernetes.io/name=grafana -o jsonpath='{.items[0].metadata.name}')

if [ -z "$GRAFANA_POD" ]; then
  echo "Grafana pod not found"
  exit 1
fi

BACKUP_DIR="/tmp/grafana-backup"
mkdir -p $BACKUP_DIR

kubectl cp monitoring/$GRAFANA_POD:/var/lib/grafana/grafana.db $BACKUP_DIR/grafana.db

echo "Grafana DB backup done at $BACKUP_DIR/grafana.db"
