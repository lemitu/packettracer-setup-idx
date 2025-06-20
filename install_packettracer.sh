#!/bin/bash

echo "🔧 Cập nhật hệ thống..."
sudo apt update && sudo apt upgrade -y

echo "📦 Cài đặt thư viện phụ thuộc..."
sudo apt install -y libx11-6 libnss3 libxss1 libasound2 libatk1.0-0 \
libatk-bridge2.0-0 libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 libgtk-3-0

echo "📂 Tìm file Packet Tracer..."
ls PacketTracer_*.tar.gz &>/dev/null
if [ $? -ne 0 ]; then
  echo "❌ Không tìm thấy file PacketTracer_*.tar.gz. Vui lòng tải về từ Cisco NetAcad và đặt vào thư mục này!"
  exit 1
fi

tar -xvzf PacketTracer_*.tar.gz
cd CiscoPacketTracer*/ || exit
chmod +x install
echo "🚀 Đang cài đặt Packet Tracer..."
sudo ./install

echo 'export PATH=$PATH:/opt/packettracer' >> ~/.bashrc
source ~/.bashrc

echo "✅ Cài đặt hoàn tất!"
