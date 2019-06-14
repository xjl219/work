[Android 命令（逆向）](https://github.com/xjl219/work/wiki/android-%E5%91%BD%E4%BB%A4)

[工作相关](https://github.com/xjl219/work/wiki/%E5%B7%A5%E4%BD%9C%E7%9B%B8%E5%85%B3)

[安装 squid](https://github.com/xjl219/work/wiki/%E5%AE%89%E8%A3%85-squid)

[flink java 环境](https://github.com/xjl219/work/wiki/flink)


[SPARK 启动参数](https://github.com/xjl219/work/wiki/SPARK-%E5%90%AF%E5%8A%A8%E5%8F%82%E6%95%B0)

IntelliJ IDEA 注册码
http://idea.lanyus.com

后台 run nc
sh -c 'nc -l 12345 0<&0 1>nc_out &'

sh -c 'nc -l 12345 0<&- 1>nc_out &'

sh -c 'tail -f /dev/null | nc -l 12345 1>nc_out &'

sh -c 'rm -f fifo; mkfifo fifo; exec 3<>fifo; nc -l 12345 0<fifo 1>nc_out &'

sh -c 'nc -lk 6789 0<&0 1>/home/dev/xjd/beta/sparktask &'


linux中如何查看某一进程的启动时间


ps -p PID -o lstart

其中PID是进程的pid

查看外网IP

curl ip.sb
