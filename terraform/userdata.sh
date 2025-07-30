#!/bin/bash
# User data for EC2 to prepare environment for Helm, kubectl, Prometheus/Grafana installation

# Update and install essentials
yum update -y
yum install -y unzip wget curl git

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm 3
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod +x get_helm.sh
./get_helm.sh

# Optional: install jq for JSON parsing
yum install -y jq

# Configure kubeconfig - you need to provide it separately or via EKS IAM role or similar

# Install Prometheus and Grafana Helm chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create namespace
kubectl create namespace monitoring || true

# Install kube-prometheus-stack (example, override configs as needed)
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack -n monitoring --values /home/ec2-user/monitoring/helm/values/monitoring.yaml

echo "Setup complete. You can now use kubectl and helm to manage your monitoring deployment."
