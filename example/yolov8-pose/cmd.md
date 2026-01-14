# 纯图片处理

```shell
 ./yolov8-pose -p rk3566 -i ~/IMG_4082.livp.jpeg
```

# 视频处理

```shell
ssh ubuntu@192.168.50.115
```

```shell
export PATH=/opt/app/go/bin:\$PATH 
export PKG_CONFIG_PATH=/home/ubuntu/opencv-install/lib/pkgconfig 
export CGO_LDFLAGS='-L/home/ubuntu/opencv-install/lib -ldl -lpthread' 
export CGO_CXXFLAGS='-I/home/ubuntu/opencv-install/include/opencv4'
```

```shell
go run bytetrack.go \
  -m ../data/models/rk3566/yolov8n-pose-rk3566.rknn \
  -t v8pose \
  -l ../data/yolov8_pose_labels_list.txt \
  -c "640x480@15" \
  -p rk3566 \
  -x person \
  -a :8081
```
