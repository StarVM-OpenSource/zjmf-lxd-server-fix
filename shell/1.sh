#!/bin/bash

# 检查是否为 Debian 12
if ! grep -q 'VERSION="12' /etc/os-release || ! grep -q 'ID=debian' /etc/os-release; then
    echo "当前系统不是 Debian 12，请使用 Debian 12 部署"
    exit 1
fi

# 更新软件源
apt update -y

# 安装必要软件包
apt install -y wget curl sudo git screen nano unzip iptables-persistent iptables

# 启动服务
systemctl start netfilter-persistent

# 开机自启
systemctl enable netfilter-persistent

# 安装 Python3 和 pip
apt install -y python3 python3-pip

# 删除 EXTERNALLY-MANAGED 文件（如果存在）
rm -f /usr/lib/python3.13/EXTERNALLY-MANAGED