#!/bin/bash

# Exit immediately if a command fails
set -e

# Variables
IMAGE_NAME="my-app"
CONTAINER_NAME="my-container"
PORT=3000

echo "🔨 Building Docker image..."
docker build -t $IMAGE_NAME .

echo "🧹 Removing old container (if exists)..."
docker rm -f $CONTAINER_NAME 2>/dev/null || true

echo "🚀 Running container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p $PORT:$PORT \
  $IMAGE_NAME

echo "✅ Container is running on port $PORT"
