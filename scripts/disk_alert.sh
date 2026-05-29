#!/bin/bash

THRESHOLD=80
CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S")

USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')

LOG_FILE="alert.log"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "[$CURRENT_DATE] ⚠️ CẢNH BÁO ĐỎ: Dung lượng ổ đĩa đã vượt mức an toàn! Đang sử dụng: $USAGE%" >> "$LOG_FILE"
    echo "Phát hiện quá tải! Đã ghi cảnh báo vào $LOG_FILE"
else
    echo "[$CURRENT_DATE] ✅ Trạng thái an toàn. Ổ đĩa đang sử dụng: $USAGE%" >> "$LOG_FILE"
    echo "Hệ thống bình thường. Đang sử dụng $USAGE%"
fi