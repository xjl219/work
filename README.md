# work
日常

yarn application -list | grep "crawler-.*beta" | awk '{print $1}' | xargs -i yarn application -kill {}



yarn application -list | grep "crawler-OperatorParser-beta" | awk '{print $1}' | xargs -i yarn application -kill {}
 
nohup ./crawler-interactive-operatorParser.sh > op.log 2>&1 &

yarn application -list | grep "crawler-OperatorReport-beta" | awk '{print $1}' | xargs -i yarn application -kill {}
nohup ./crawler-interactive-operatorReport.sh > or.log 2>&1 &


yarn application -list | grep "crawler-CreditDataParser-beta" | awk '{print $1}' | xargs -i yarn application -kill {}

nohup ./crawler-interactive-CreditParser.sh > cdt.log 2>&1 &


yarn application -list | grep "crawler-OperatorParser-online" | awk '{print $1}' | xargs -i yarn application -kill {}

yarn application -list | grep "crawler-OperatorReport-online" | awk '{print $1}' | xargs -i yarn application -kill {}
nohup ./crawler-interactive-operatorReport.sh




yarn application -list | grep "crawler-GJJParser-online" | awk '{print $1}' | xargs -i yarn application -kill {}


yarn application -list | grep "crawler-GJJParser-beta" | awk '{print $1}' | xargs -i yarn application -kill {}
nohup ./crawler-interactive-GJJParser.sh> gjj.log 2>&1 &

nohup ./crawler-interactive-JDParser.sh > jd.log 2>&1 &

yarn application -list | grep "crawler-JDParser-beta" | awk '{print $1}' | xargs -i yarn application -kill {}


yarn application -list | grep "crawler-GJJParser" | awk '{print $1}' | xargs -i yarn application -kill {}


yarn application -list | grep "crawler-GJJReport-beta" | awk '{print $1}' | xargs -i yarn application -kill {}


yarn application -list | grep "crawler-GJJReport-online" | awk '{print $1}' | xargs -i yarn application -kill {}


nohup ./crawler-interactive-GJJParser2.sh> gjj.log 2>&1 &

nohup ./crawler-interactive-JDParser2.sh > jd.log 2>&1 &

yarn application -list | grep "crawler-JDParser-" | awk '{print $1}' | xargs -i yarn application -kill {}

http://fdw1.fengjr.inc:8088/cluster/app/application_1522760337009_1252531


spark任务监控脚本
nohup /home/dev/xjd/online/monitor.sh online jobs.list monition.log 100s &

crawler-GJJParser-online,crawler-interactive-GJJParser.sh
crawler-OperatorParser-online,crawler-interactive-operatorParser.sh
crawler-OperatorReport-online,crawler-interactive-operatorReport.sh
crawler-JDParser-online,crawler-interactive-JDParser.sh
crawler-GJJReport-online,crawler-interactive-GJJReport.sh

第三方接入启动
/home/dev/social/start.sh
第三方元数据存储目录
/home/dev/crawler/downflie

查找目录下的所有文件中是否含有某个字符串 

find .|xargs grep -ri "IBM" 

 public static final String DATA_TYPE_SZSY = "szsy";

select * from crawler_progress where id_num='110222199212034314'

select count(1),status  from gjj_progress where insert_time between '2018-06-21 00:00:00' and '2018-06-27 23:59:59' group by status
unionall
select count(1),status  from gjj_wecash8Ele where insert_time between '2018-06-21 00:00:00' and '2018-06-27 23:59:59' group by status

select count(1),step2 from crawler_progress where type='gjj' and step1='parser' and insert_time between '2018-06-08 00:00:00' and '2018-06-14 23:59:59' group by step2



hosts: ["10.10.204.14:9301", "10.10.203.136","10.10.204.31"]
 
head地址：http://10.10.204.31:9100/

_delete_by_query

https://open.wecash.net/api/fund/v3/init/100478/123

kinit -k -t  /home/dev/xjd/beta/hdfs1.keytab hdfs@hadoop_edw

2018-06-04 16:46:03,328
2018-06-04 16:46:13,735
 
  "report_application_check":[],
     "report_behavior_check":[],
"mobile_call_report":[],
"report_cell_behavior":[],


    {
        "id": "500226199112143975",
        "phone": "15221397386_mz",
        "org_id": "crawler",
    
      
      "report_application_check":[],
         "report_behavior_check":[],
    "mobile_call_report":[],
    "report_cell_behavior":[],
    "report_contact_list_3m":[],
     "report_contact_list_1m":[],
    "report_contact_list":[]
       
    }




51运营商
https://apizza.net/console/project/9173a55420b9c98426279efd055217fb/browse
15DE8E47F82C419889FBD240F5C3A2F720180502151547

-Dsun.security.krb5.debug=true
 -Dspark.master=local[*] 
 -Dspark.app.name=DataCheckReportTest
  -Djava.security.auth.login.config=/Users/xujl-mac/work/projects/idea/fengjr-interactive-crawler-data-process/src/main/config/jaas.conf 
  -Djava.security.krb5.conf=/Users/xujl-mac/work/projects/idea/fengjr-interactive-crawler-data-process/src/main/config/krb5.conf
   -Dspark.files=/Users/xujl-mac/work/projects/idea/fengjr-interactive-crawler-data-process/src/main/resources/hdfs.keytab




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



