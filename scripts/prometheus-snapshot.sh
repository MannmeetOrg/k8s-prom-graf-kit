#!/bin/bash
# Create snapshot of Prometheus TSDB and optionally upload to S3

PROMETHEUS_URL=http://localhost:9090
SNAPSHOT_DIR="/tmp/prometheus-snapshots"
S3_BUCKET="your-s3-bucket-name"

mkdir -p $SNAPSHOT_DIR

SNAPSHOT_ID=$(curl -XPOST ${PROMETHEUS_URL}/api/v1/admin/tsdb/snapshot | jq -r '.data.name')

if [ -z "$SNAPSHOT_ID" ]; then
  echo "Failed to create snapshot"
  exit 1
fi

echo "Snapshot created: $SNAPSHOT_ID"
SNAPSHOT_PATH="${SNAPSHOT_DIR}/${SNAPSHOT_ID}"

# Assuming Prometheus data dir mounted here, adjust as needed
cp -r /prometheus/data/snapshots/$SNAPSHOT_ID $SNAPSHOT_PATH

# Upload to S3 (requires awscli installed and configured)
aws s3 cp --recursive $SNAPSHOT_PATH s3://$S3_BUCKET/prometheus/snapshots/$SNAPSHOT_ID/

echo "Snapshot uploaded to S3 bucket $S3_BUCKET"
