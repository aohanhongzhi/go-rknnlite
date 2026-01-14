#!/bin/bash

# YOLOv8 Pose 流媒体服务 - 快速启动脚本

echo "=== 启动 YOLOv8 Pose 摄像头流媒体服务 ==="

# 设置所有必要的环境变量
export PATH=/opt/app/go/bin:$PATH
export PKG_CONFIG_PATH=/home/ubuntu/opencv-install/lib/pkgconfig:$PKG_CONFIG_PATH
export CGO_LDFLAGS="-L/home/ubuntu/opencv-install/lib -ldl -lpthread"
export CGO_CXXFLAGS="-I/home/ubuntu/opencv-install/include/opencv4"
export LD_LIBRARY_PATH="/home/ubuntu/opencv-install/lib:$LD_LIBRARY_PATH"

echo "✓ 环境变量已设置"

# 检查摄像头
echo "正在检查摄像头..."
for i in 0 1 2; do
    if [ -e "/dev/video$i" ]; then
        echo "✓ 发现摄像头: /dev/video$i"
        break
    fi
done

# 进入项目目录
cd ~/go-rknnlite/example/stream

echo "✓ 当前目录: $(pwd)"
echo "✓ Go版本: $(go version)"

echo ""
echo "启动 YOLOv8 Pose 流媒体服务..."
echo "服务将在 http://192.168.50.115:8081/stream 上提供"
echo ""
echo "按 Ctrl+C 停止服务"
echo ""

# 启动服务
exec go run bytetrack.go \
  -m ../data/models/rk3566/yolov8n-pose-rk3566.rknn \
  -t v8pose \
  -l ../data/yolov8_pose_labels_list.txt \
  -c "640x480@10" \
  -p rk3566 \
  -x person \
  -a :8081