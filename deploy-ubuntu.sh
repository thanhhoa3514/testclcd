#!/bin/bash

# Script tự động deploy React app lên Ubuntu Server
# Sử dụng: ./deploy-ubuntu.sh

# Cấu hình - Thay đổi các giá trị này
SERVER_USER="your-username"
SERVER_HOST="your-server-ip"
SERVER_PATH="/var/www/react-app"
SSH_KEY="~/.ssh/id_rsa"  # Đường dẫn đến SSH key

echo "=========================================="
echo "Deploy React App to Ubuntu Server"
echo "=========================================="

# Bước 1: Build React app
echo ""
echo "[1/4] Building React app..."
npm run build

if [ $? -ne 0 ]; then
    echo "Error: Build failed!"
    exit 1
fi

echo "Build successful!"

# Bước 2: Tạo thư mục trên server (nếu chưa có)
echo ""
echo "[2/4] Creating directory on server..."
ssh -i "$SSH_KEY" "$SERVER_USER@$SERVER_HOST" "sudo mkdir -p $SERVER_PATH && sudo chown -R $SERVER_USER:$SERVER_USER $SERVER_PATH"

# Bước 3: Upload files lên server
echo ""
echo "[3/4] Uploading files to server..."
rsync -avz --delete -e "ssh -i $SSH_KEY" build/ "$SERVER_USER@$SERVER_HOST:$SERVER_PATH/"

if [ $? -ne 0 ]; then
    echo "Error: Upload failed!"
    exit 1
fi

echo "Upload successful!"

# Bước 4: Restart Nginx (nếu cần)
echo ""
echo "[4/4] Restarting Nginx..."
ssh -i "$SSH_KEY" "$SERVER_USER@$SERVER_HOST" "sudo systemctl restart nginx"

echo ""
echo "=========================================="
echo "Deploy completed successfully!"
echo "=========================================="
echo ""
echo "Your app is now live at: http://$SERVER_HOST"

