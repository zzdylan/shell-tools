#!/bin/bash

# 设置 Go 的版本
GO_VERSION="1.21.0"  # 你可以根据需要修改版本号

# 下载 Go 的安装包
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz

# 删除旧版本的 Go（如果存在）
sudo rm -rf /usr/local/go

# 解压安装包到 /usr/local
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

# 删除下载的安装包
rm go${GO_VERSION}.linux-amd64.tar.gz

# 设置环境变量
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
echo "export GOPATH=\$HOME/go" >> ~/.bashrc
echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc

# 使环境变量立即生效
source ~/.bashrc

# 验证安装
go version

echo "Go ${GO_VERSION} 安装完成！"