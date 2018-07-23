#!/bin/bash -
fn=$0
# if [[  $1 == 'stop'  ]]; then
#     arra=(${fn//// })
#     l=${#arra[@]}
#     let 'l=l-1'
#     task=`pwd`/${arra[$l]}
#     ps -ef |grep $task |grep -v 'grep' | awk '{print $2}' |xargs kill -9
#     exit 1
# fi

if [ $# -ne 4 ] ; then
      #  echo '参数个数为1时并且参数1为 “stop”，杀掉已经运行监控脚本'
        echo '参数错误 '$0' <beta> <jobs.list> <monition.log> <10s>'
        echo 'ie '$0' beta jobs.list monition.log 10s'
        echo  '参数1：job名称后缀'
        echo  '参数2：jobname文件'
        echo  ' ie文件内容'
        echo  'crawler-GJJReport-beta,crawler-interactive-GJJReport.sh'
        echo  '逗号前面为jobname，逗号后面为job启动命令，每行不能有空不字符'
        echo  '参数3：log输出文件,'
        echo  '参数4：监控轮询间隔间参考sleep命令'
        exit 1
fi
echo $1 $2 $3 $4
logf=$$'-'$3
echo $logf
total=0
echo "start..." > $logf
while [ 1=1 ] ; do
    kinit -k -t  /home/dev/xjd/beta/hdfs1.keytab hdfs@hadoop_edw

     cdate=(`date "+%Y-%m-%d"`)
    jobs=(`yarn application -list | grep "crawler-.*"$1 | awk '{print $2}' `)
    echo ${jobs[@]} >> $logf
     hassrash=0
     for job in $(cat $2); do
        echo ${job} >> $logf
        arr=(${job//,/ })
        curtime=(`date "+%H:%M:%S"`)
        if ! [[ "${jobs[@]}" =~ ${arr[0]} ]] ; then
                nohup ./${arr[1]} > ${arr[0]} 2>&1 &
                echo $cdate $curtime ${arr[0]}" is restarted"  >> $logf
                let 'total=total+1'
                let 'hassrash=hassrash+1'
        fi
    done
    curtime=(`date "+%H:%M:%S"`)
    echo $cdate $curtime' hassrash:'$hassrash 'total:'$total >> $logf
sleep $4

done
