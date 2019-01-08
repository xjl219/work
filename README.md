# work
日常


安装 squid

查看ip
curl icanhazip.com

yum install -y squid

vim /etc/squid/squid.conf
初始化Squid


squid -z
启动命令与开机自启
# 启动
squid -s
# 启动
systemctl start squid.service
# 停止
systemctl stop squid.service
# 重启
systemctl restart squid.service
 
#设置开机自启
systemctl enable squid.service



REPORT_APPLICATION_CHECK
安装 squid

查看ip
curl icanhazip.com

yum install -y squid

vim /etc/squid/squid.conf
初始化Squid


squid -z
启动命令与开机自启
# 启动
squid -s
 
#设置开机自启
chkconfig  squid on
