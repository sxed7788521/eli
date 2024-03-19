# elixir一键部署
先下载官网Dockerfile文件填写文件密钥，地址，自定义名字，下载地址：https://files.elixir.finance/Dockerfile

下载好文件（填写内容的文件）然后一键运行下面的环境脚本

wget -O update.sh https://raw.githubusercontent.com/sxed7788521/eli/main/update.sh && chmod +x update.sh && ./update.sh

然后在下在安装和运行的部署代码

wget -O elixir.sh https://raw.githubusercontent.com/sxed7788521/eli/main/elixir.sh && chmod +x elixir.sh && ./elixir.sh

设置别名没有看但是cat ~/.bashrc文件末尾有，直接手动执行source ~/.bashrc
