#!/bin/bash

echo "请选择要运行的操作："
echo "1. 生成 Docker 映像 elixir"
echo "2. 不加自动重启的启动 elixir"
echo "3. 加自动重启的启动 elixir"
echo "4. 查看最后10行 elixir 日志"
echo "5. 查看 Docker 容器信息"
echo "6. 查看 Docker 版本信息"
echo "7. 结束进程 elixir 并升级/获取最新版本再运行"
echo "8. 添加 elixir 快捷方式"
echo "9. 重新加载 ~/.bashrc 文件"
read choice

case $choice in
    1)
        echo "生成 Docker 映像 elixir ..."
        source /root/elixir.sh
        if docker build . -f Dockerfile -t elixir-validator; then
            echo "Docker 映像 elixir 已成功生成"
        else
            echo "生成 Docker 映像 elixir 出错"
        fi
        ;;
    2)
        echo "启动 elixir ..."
        if docker run -it --name ev elixir-validator; then
            echo "elixir 成功启动"
        else
            echo "启动 elixir 出错"
        fi
        ;;
    3)
        echo "启动 elixir 并设置为自动重启 ..."
        if docker run -d --restart unless-stopped --name ev elixir-validator; then
            echo "elixir 成功启动并设置为自动重启"
        else
            echo "启动 elixir 出错"
        fi
        ;;
    4)
        echo "查看 elixir 日志 ..."
        if docker logs -t --tail=10 ev; then
            echo "成功查看 elixir 日志"
        else
            echo "查看 elixir 日志出错"
        fi
        ;;
    5)
        docker ps
        ;;
    6)
        docker -v
        ;;
    7)
        echo "结束进程 elixir 并升级/获取最新版本再运行 ..."
        source /root/elixir.sh
        if docker kill ev && docker rm ev && docker pull elixirprotocol/validator:testnet-2 && docker build . -f Dockerfile -t elixir-validator && docker run -d --restart unless-stopped --name ev elixir-validator; then
            echo "成功结束进程 elixir 并升级/获取最新版本再运行"
        else
            echo "结束进程 elixir 并升级/获取最新版本再运行出错"
        fi
        ;;
    8)
        echo "添加 elixir 快捷方式 ..."
        source /root/elixir.sh
        if grep -q 'alias elixir="/root/elixir.sh"' ~/.bashrc; then
            echo "别名 elixir 已存在"
        else
            echo 'alias elixir="/root/elixir.sh"' >> ~/.bashrc
            echo "成功添加别名 elixir"
        fi
        ;;
    9)
        echo "重新加载 ~/.bashrc 文件 ..."
        source ~/.bashrc
        echo "成功重新加载 ~/.bashrc 文件"
        echo "检查是否存在别名 elixir："
        if alias elixir &> /dev/null; then
            echo "别名 elixir 存在"
        else
            echo "别名 elixir 不存在"
        fi
        ;;
    *)
        echo "无效的选择"
        ;;
esac
