#!/bin/bash

# 更新包索引
sudo apt-get update

# 安装必要的依赖包
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 添加 Docker 的官方 GPG 密钥
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# 添加 Docker 的稳定版仓库
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 再次更新包索引
sudo apt-get update

# 安装 Docker Engine
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# 启动 Docker 服务并设置为开机自启
sudo systemctl start docker
sudo systemctl enable docker

# 验证 Docker 是否安装成功
sudo docker run hello-world

# 将当前用户添加到 docker 组，避免每次使用 docker 都需要 sudo
sudo usermod -aG docker $USER

# 立即生效，无需重新登录
newgrp docker

echo "Docker 安装完成！当前会话已生效，无需重新登录。"