**查询冗余索引、重复索引**

select a.`table_schema`,a.`table_name`,a.`index_name`,a.`index_columns`,b.`index_name`,b.`index_columns`,concat('ALTER TABLE `',a.`table_schema`,'`.`',a.`table_name`,'` DROP INDEX `',a.`index_name`,'`') from ((select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `table_schema`,`information_schema`.`statistics`.`TABLE_NAME` AS `table_name`,`information_schema`.`statistics`.`INDEX_NAME` AS `index_name`,max(`information_schema`.`statistics`.`NON_UNIQUE`) AS `non_unique`,max(if(isnull(`information_schema`.`statistics`.`SUB_PART`),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`statistics`.`COLUMN_NAME` order by `information_schema`.`statistics`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns` from `information_schema`.`statistics` where ((`information_schema`.`statistics`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`statistics`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME`) a join (select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `table_schema`,`information_schema`.`statistics`.`TABLE_NAME` AS `table_name`,`information_schema`.`statistics`.`INDEX_NAME` AS `index_name`,max(`information_schema`.`statistics`.`NON_UNIQUE`) AS `non_unique`,max(if(isnull(`information_schema`.`statistics`.`SUB_PART`),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`statistics`.`COLUMN_NAME` order by `information_schema`.`statistics`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns` from `information_schema`.`statistics` where ((`information_schema`.`statistics`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`statistics`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME`) b on(((a.`table_schema` = b.`table_schema`) and (a.`table_name` = b.`table_name`)))) where ((a.`index_name` <> b.`index_name`) and (((a.`index_columns` = b.`index_columns`) and ((a.`non_unique` > b.`non_unique`) or ((a.`non_unique` = b.`non_unique`) and (if((a.`index_name` = 'PRIMARY'),'',a.`index_name`) > if((b.`index_name` = 'PRIMARY'),'',b.`index_name`))))) or ((locate(concat(a.`index_columns`,','),b.`index_columns`) = 1) and (a.`non_unique` = 1)) or ((locate(concat(b.`index_columns`,','),a.`index_columns`) = 1) and (b.`non_unique` = 0))));


**查询未使用过的索引**

select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `table_schema`,`information_schema`.`statistics`.`TABLE_NAME` AS `table_name`,`information_schema`.`statistics`.`INDEX_NAME` AS `index_name`,max(`information_schema`.`statistics`.`NON_UNIQUE`) AS `non_unique`,max(if(isnull(`information_schema`.`statistics`.`SUB_PART`),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`statistics`.`COLUMN_NAME` order by `information_schema`.`statistics`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns` from `information_schema`.`statistics` where ((`information_schema`.`statistics`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`statistics`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME`

                        
原文链接：https://blog.csdn.net/u014609263/article/details/113540365

这段内容是关于MySQL数据库中`PERFORMANCE_SCHEMA`数据库的使用说明，特别是`table_io_waits_summary_by_index_usage`表的介绍和查询示例。以下是对这部分内容的解释：

1. **时间单位说明**：
   - 注意：以上的时间单位为皮秒（1秒=1×10^12皮秒）。这意味着表中记录的时间数据是以皮秒为单位的，这是一个非常小的时间单位，1皮秒等于一万亿分之一秒。

2. **常用查询**：
   - **查看冗余索引**：通过查询`table_io_waits_summary_by_index_usage`表，找出`COUNT_STAR`（总I/O操作次数）和`SUM_TIMER_WAIT`（总等待时间）都为0的索引。这些索引可能是冗余的，因为它们没有被使用，这可能会导致数据库操作变慢。
     ```sql
     SELECT *
     FROM `performance_schema`.`table_io_waits_summary_by_index_usage`
     WHERE COUNT_STAR = 0 AND SUM_TIMER_WAIT = 0
     ```
   - **查看性能较差的索引**：通过查询`table_io_waits_summary_by_index_usage`表，并按照`MAX_TIMER_WAIT`（最大等待时间）降序排序，可以找出性能最差的索引。
     ```sql
     SELECT *
     FROM `performance_schema`.`table_io_waits_summary_by_index_usage`
     ORDER BY MAX_TIMER_WAIT DESC
     ```
   - **查看某张表是否有不使用索引的情况**：通过查询`table_io_waits_summary_by_index_usage`表，找出特定表（`OBJECT_NAME = 'table_name'`）且`INDEX_NAME`为NULL的情况，这表示表的I/O操作没有使用索引。
     ```sql
     SELECT *
     FROM `performance_schema`.`table_io_waits_summary_by_index_usage`
     WHERE OBJECT_NAME = 'table_name' AND INDEX_NAME IS NULL
     ```

这些查询可以帮助数据库管理员分析和优化数据库的性能，通过识别和处理冗余或性能差的索引，以及确保所有操作都有效利用索引。


[jdk-8u241-b07](https://download.oracle.com/otn/java/jdk/8u241-b07/1f5b5a70bf22433b84d0e960903adac8/jdk-8u241-macosx-x64.dmg?AuthParam=1579659705_54d3719537719ce665ba90821440a709)



[Android 命令（逆向）](https://github.com/xjl219/work/wiki/android-%E5%91%BD%E4%BB%A4)

[工作相关](https://github.com/xjl219/work/wiki/%E5%B7%A5%E4%BD%9C%E7%9B%B8%E5%85%B3)

[安装 squid](https://github.com/xjl219/work/wiki/%E5%AE%89%E8%A3%85-squid)

[flink java 环境](https://github.com/xjl219/work/wiki/flink)


[SPARK 启动参数](https://github.com/xjl219/work/wiki/SPARK-%E5%90%AF%E5%8A%A8%E5%8F%82%E6%95%B0)


[Chromeheadless安装与使用](https://blog.csdn.net/aWDac/article/details/80865754)

IntelliJ IDEA 注册码
http://idea.lanyus.com

Chrome 插件的方法：访问这个网站 https://crxdl.com/ 即可下载 Chrome 扩展插件 Crx 离线安装包。




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
