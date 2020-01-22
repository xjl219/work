


[jdk/8u241-b07](https://download.oracle.com/otn/java/jdk/8u241-b07/1f5b5a70bf22433b84d0e960903adac8/jdk-8u241-macosx-x64.dmg?AuthParam=1579659705_54d3719537719ce665ba90821440a709)
[Android 命令（逆向）](https://github.com/xjl219/work/wiki/android-%E5%91%BD%E4%BB%A4)

[工作相关](https://github.com/xjl219/work/wiki/%E5%B7%A5%E4%BD%9C%E7%9B%B8%E5%85%B3)

[安装 squid](https://github.com/xjl219/work/wiki/%E5%AE%89%E8%A3%85-squid)

[flink java 环境](https://github.com/xjl219/work/wiki/flink)


[SPARK 启动参数](https://github.com/xjl219/work/wiki/SPARK-%E5%90%AF%E5%8A%A8%E5%8F%82%E6%95%B0)


[Chromeheadless安装与使用](https://blog.csdn.net/aWDac/article/details/80865754)

IntelliJ IDEA 注册码
http://idea.lanyus.com


 find ./ -maxdepth 1  -name '*-*.sh'  -exec sed -i 's/home\/dev\/xjd\/beta\/hbase-site.xml/home\/dev\/xjd\/file\/hbase-site.xml/g' {} \;

大写转小写

search: [A-Z]

replace: \L$0

 

小写转大写

search: [a-z]

replace: \U$0

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
