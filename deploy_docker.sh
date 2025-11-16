#!/bin/bash

# Script deploy React app với Docker
# Sử dụng: ./deploy-docker.sh

echo "=========================================="
echo "Deploy React App with Docker"
echo "=========================================="

# Tên image và container
IMAGE_NAME="react-app"
CONTAINER_NAME="react-app-container"
PORT="80"

# Bước 1: Build Docker image
echo ""
echo "[1/4] Building Docker image..."
docker build -t $IMAGE_NAME .

if [ $? -ne 0 ]; then
    echo "Error: Docker build failed!"
    exit 1
fi

echo "Docker image built successfully!"

# Bước 2: Stop và xóa container cũ (nếu có)
echo ""
echo "[2/4] Stopping old container..."
docker stop $CONTAINER_NAME 2>/dev/null
docker rm $CONTAINER_NAME 2>/dev/null

# Bước 3: Run container mới
echo ""
echo "[3/4] Starting new container..."
docker run -d -p $PORT:80 --name $CONTAINER_NAME --restart unless-stopped $IMAGE_NAME

if [ $? -ne 0 ]; then
    echo "Error: Failed to start container!"
    exit 1
fi

# Bước 4: Kiểm tra container đang chạy
echo ""
echo "[4/4] Checking container status..."
docker ps | grep $CONTAINER_NAME

echo ""
echo "=========================================="
echo "Deploy completed successfully!"
echo "=========================================="
echo ""
echo "Container is running on port $PORT"
echo "Access your app at: http://localhost:$PORT"
echo ""
echo "Useful commands:"
echo "  - View logs: docker logs $CONTAINER_NAME"
echo "  - Stop container: docker stop $CONTAINER_NAME"
echo "  - Restart container: docker restart $CONTAINER_NAME"

