#!/bin/bash

# 环境设置脚本 - YOLOv8 Pose 流媒体服务
echo "=== 设置环境变量 ==="
export PATH=/opt/app/go/bin:$PATH
export PKG_CONFIG_PATH=/home/ubuntu/opencv-install/lib/pkgconfig:$PKG_CONFIG_PATH
export CGO_LDFLAGS="-L/home/ubuntu/opencv-install/lib -ldl -lpthread"
export CGO_CXXFLAGS="-I/home/ubuntu/opencv-install/include/opencv4"
export LD_LIBRARY_PATH="/home/ubuntu/opencv-install/lib:$LD_LIBRARY_PATH"

echo "环境变量已设置"
echo "启动 YOLOv8 Pose 流媒体服务..."

# 进入目录并运行服务
cd ~/go-rknnlite/example/stream

echo "当前目录: $(pwd)"
echo "Go 版本: $(go version)"

# 启动服务
exec go run bytetrack.go \
  -m ../data/models/rk3566/yolov8n-pose-rk3566.rknn \
  -t v8pose \
  -l ../data/yolov8_pose_labels_list.txt \
  -c "640x480@15" \
  -p rk3566 \
  -x person \
  -a :8081