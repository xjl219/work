num_executors=4
executor_memory=2g
executor_cores=1
/opt/fengjrspark/spark-2.2.1-client/bin/spark-submit --master yarn --deploy-mode cluster `#调试用client,好查错/cluster`\
  --name crawler-OperatorParser-online	\
  --class com.fengjr.function.OperatorParser \
  --driver-memory 2g \
  --num-executors ${num_executors}  \
  --executor-cores ${executor_cores}  \
  --executor-memory ${executor_memory} \
  --conf spark.streaming.kafka.maxRetries=4	\
  --conf spark.yarn.max.executor.failures=12	\
  --conf spark.yarn.maxAppAttempts=4	\
  --conf spark.yarn.driver.memoryOverhead=512 \
  --conf spark.cleaner.ttl=600 `#清空过期RDD` \
  --conf spark.streaming.stopGracefullyOnShutdown=true `# 优雅关闭` \
  --conf spark.hadoop.fs.hdfs.impl.disable.cache=true \
  --conf spark.driver.extraJavaOptions=-Dlog4j.configuration=log4j-yarn.properties \
  --conf spark.executor.extraJavaOptions=-Dlog4j.configuration=log4j-yarn.properties \
  --conf spark.serializer=org.apache.spark.serializer.KryoSerializer \
  --conf spark.logConf=true \
  --conf spark.dynamicAllocation.enabled=false `# 动态分配` \
  --conf spark.streaming.stopGracefullyOnShutdown=true	\
  --conf spark.driver.userClassPathFirst=true \
  --conf spark.executor.userClassPathFirst=true \
  --principal hdfs@hadoop_edw \
  --keytab /home/dev/xjd/file/hdfs1.keytab \
  --files /home/dev/xjd/file/hdfs.keytab,/home/dev/xjd/file/hbase-site.xml,/home/dev/xjd/file/log4j-yarn.properties \
  /home/dev/xjd/online/fengjr-interactive-crawler-DataProcess-1.0-SNAPSHOT.jar
