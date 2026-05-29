#!/bin/bash

###############################################################
# Install Packages Script
# Cài đặt các gói cần thiết cho dự án git-action-lab
###############################################################

set -e  # Dừng script nếu có lỗi

# Màu sắc cho output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Hàm in thông báo
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[*]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Kiểm tra quyền root (nếu cần)
# if [ "$EUID" -ne 0 ]; then 
#    print_error "Script này cần chạy với quyền root (sudo)"
#    exit 1
# fi

print_info "Bắt đầu cài đặt các gói cần thiết..."
echo "============================================"

# Cập nhật package lists
print_info "Cập nhật package lists..."
apt-get update -qq

# Cài đặt các gói cần thiết
print_info "Cài đặt các gói..."

# Công cụ cơ bản
apt-get install -y \
    curl \
    wget \
    git \
    nano \
    vim \
    htop \
    net-tools \
    jq

# Công cụ cho shell scripting
apt-get install -y \
    bash \
    sed \
    awk \
    grep

# Docker & docker-compose (tuỳ chọn)
# apt-get install -y docker.io docker-compose

print_status "Cài đặt hoàn tất!"
echo "============================================"

# Hiển thị thông tin phiên bản
print_info "Thông tin phiên bản các công cụ:"
echo "Bash version: $(bash --version | head -n 1)"
echo "Git version: $(git --version)"
echo "Curl version: $(curl --version | head -n 1)"

print_status "Tất cả các gói đã được cài đặt thành công!"
