#!/bin/bash
P=$(date "+%Y-%m-%d")

echo {"-------------오늘은 $P입니다. 데이터 배치 분석 자동화 시작합니다.-------------"}

echo "[]" > $FileBeat/data/registry/filebeat/data.json
echo "--------------FileBeat 넣은 데이터 초기화-------------------"

echo "-------------하둡 스파크 시작-----------------------"
$HADOOP_HOME/sbin/start-all.sh
$SPARK_HOME/sbin/start-all.sh
echo "-------------하둡 스파크 시작 완료 ------------------------"


echo "-------------파일비트로부터 데이터를 읽고 Logstash에서 필터링하여 보내기 시작합니다.----------"
$FileBeat/filebeat -c $FileBeat/filebeat.yml -d "publish" &
$LogStash/bin/logstash -f $LogStash/config/access-apache.conf &


echo "-------------데이터 전송중 .... --------5분간 기다렸다가 데이터 분석을 시작합니다. ------"
sleep 5m


echo "-------------데이터 분석 시작------------"
$SPARK_HOME/bin/spark-submit --class Auto --master yarn /home/bigdata/AutoLab/Auto/target/scala-2.12/autolog-project_2.12-1.3.jar
echo "-------------데이터 분석 완료------------"


echo "-------------ES INDEX 삭제 시작----------"
sleep 30s
curl -X DELETE "220.69.209.54:9481/logstash-autolog?pretty"
echo "-------------ES INDEX 삭제 완료 ---------"

logstashpid=$(lsof -i:5044 | grep 'LISTEN' | awk '{print $2}')

echo "-------------파일비트 로그스태시 종료 시작-----"
pkill -9 -ef filebeat
kill -9 $logstashpid
echo "-------------파일비트 로그스태시 종료 완료-----"
sleep 5s


echo "-------------HDFS -> LocalFS 로 복사 시작 -----"
hadoop fs -copyToLocal /Auto/$P/*.json /home/bigdata/AutoLab/Week_DF/$P.json
hadoop fs -rm /Auto/$P/*
hadoop fs -rmdir /Auto/$P
echo "-------------LocalFS로 복사 완료 ----------"
sleep 5s
echo "-------------하둡 스파크 종료 --------------"
$SPARK_HOME/sbin/stop-all.sh
$HADOOP_HOME/sbin/stop-all.sh
echo "-------------하둡 스파크 종료 완료----------------"
