#!/bin/bash

# Environment setup for go-rknnlite with custom OpenCV
export PATH=/opt/app/go/bin:$PATH
export PKG_CONFIG_PATH=/home/ubuntu/opencv-install/lib/pkgconfig:$PKG_CONFIG_PATH
export CGO_LDFLAGS="-L/home/ubuntu/opencv-install/lib -ldl -lpthread"
export CGO_CXXFLAGS="-I/home/ubuntu/opencv-install/include/opencv4"

echo "Environment variables set:"
echo "PATH: $PATH"
echo "PKG_CONFIG_PATH: $PKG_CONFIG_PATH"
echo "CGO_LDFLAGS: $CGO_LDFLAGS"
echo "CGO_CXXFLAGS: $CGO_CXXFLAGS"

# If arguments provided, execute them
if [ $# -gt 0 ]; then
    echo "Executing: $@"
    exec "$@"
fi