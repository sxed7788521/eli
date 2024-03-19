#!/bin/bash

# 检测系统类型
if [ -x "$(command -v apt)" ]; then
    # Ubuntu/Debian系统，使用APT
    echo "正在更新APT软件包列表..."
    sudo apt update
    echo "更新APT软件包列表完成。"
    
    echo "正在升级系统..."
    sudo apt upgrade -y
    echo "系统升级完成。"

elif [ -x "$(command -v yum)" ]; then
    # CentOS/RHEL系统，使用YUM
    echo "正在更新YUM软件包列表..."
    sudo yum update -y
    echo "更新YUM软件包列表完成。"

    echo "正在升级系统..."
    sudo yum upgrade -y
    echo "系统升级完成。"

else
    echo "错误：未知的系统类型或软件包管理器未安装。"
    exit 1
fi
