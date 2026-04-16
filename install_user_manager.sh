#!/bin/bash

clear
echo "===== ONE CLICK INSTALL USER MANAGER ====="

SCRIPT_URL="https://raw.githubusercontent.com/AdD-BAnK-Repo/sc_v1/refs/heads/master/user_manager.sh"
INSTALL_PATH="/usr/local/bin/user-manager"

if [ "$EUID" -ne 0 ]; then
  echo "[ERROR] Please run as root"
  exit 1
fi

echo "[INFO] Removing old version..."
rm -f $INSTALL_PATH

echo "[INFO] Downloading latest script..."
wget -q -O $INSTALL_PATH $SCRIPT_URL

if [ ! -f "$INSTALL_PATH" ]; then
  echo "[ERROR] Download failed"
  exit 1
fi

echo "[INFO] Setting permission..."
chmod +x $INSTALL_PATH

echo "[INFO] Creating shortcut command..."
ln -sf $INSTALL_PATH /usr/bin/user-manager

echo "[INFO] Creating log file..."
touch /var/log/user_manager.log
chmod 644 /var/log/user_manager.log

echo ""
echo "=========================================="
echo "[SUCCESS] ติดตั้งเสร็จแล้ว แอดแบงค์!"
echo "=========================================="
echo ""
echo "📌 วิธีใช้งาน:"
echo "   user-manager"
echo ""
echo "📌 คำสั่งอื่นๆ:"
echo "   user-manager notify <ข้อความ>  - ส่ง notification"
echo "   user-manager xnotify <ข้อความ>  - ส่ง notification + dialog"
echo "   user-manager alert              - แสดง alert"
echo "   user-manager xalert             - แสดง alert dialog"
echo ""
echo "📁 Script: $INSTALL_PATH"
echo "📁 Log: /var/log/user_manager.log"
echo "=========================================="
echo ""
