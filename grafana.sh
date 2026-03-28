#!/bin/bash

set -e

# Variables
CONTAINER_NAME="grafana"
PORT=3000
ADMIN_USER="admin"
ADMIN_PASSWORD="admin"

echo "🧹 Removing old Grafana container (if exists)..."
docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "🚀 Starting Grafana..."

docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:3000 \
  -e GF_SECURITY_ADMIN_USER=$ADMIN_USER \
  -e GF_SECURITY_ADMIN_PASSWORD=$ADMIN_PASSWORD \
  -v grafana-storage:/var/lib/grafana \
  grafana/grafana-oss

echo "✅ Grafana is running at: http://localhost:$PORT"
echo "🔑 Login with: $ADMIN_USER / $ADMIN_PASSWORD"
