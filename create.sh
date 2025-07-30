#!/bin/bash

# Script to create the Kubernetes monitoring GitHub repository directory structure

# Base directories
mkdir -p crds/podmonitors
mkdir -p crds/prometheusrules
mkdir -p crds/servicemonitors
mkdir -p grafana/provisioning/alerting
mkdir -p grafana/provisioning/dashboards
mkdir -p grafana/provisioning/datasources
mkdir -p helm/values
mkdir -p k8s/ingress
mkdir -p scripts
mkdir -p terraform
mkdir -p .github/workflows

# Print success message
echo "Directory structure created successfully."
