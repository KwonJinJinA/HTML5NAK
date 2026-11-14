#!/bin/sh
ulimit -HSn 65534

PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

# Get standard environment variables
PRGDIR=`dirname "$PRG"`

APP_HOME=`cd "$PRGDIR/.." >/dev/null; pwd`

[ -f ${APP_HOME}/log/app.out ] && mv ${APP_HOME}/log/app.out ${APP_HOME}/log/app.out.$Time
cd $APP_HOME

#JVM_START="-server -Xmx4g -Xms3g -Xmn2g -Xss256k -XX:MaxPermSize=256m -XX:+UseParallelGC -XX:ParallelGCThreads=4 -XX:+UseParallelOldGC  -XX:MaxGCPauseMillis=100 -XX:+UseAdaptiveSizePolicy"
#JVM_START="-server -Xms256m -Xmx512m -Xss256k -XX:MaxPermSize=256m -XX:+UseParallelGC -XX:ParallelGCThreads=2 -XX:+UseParallelOldGC  -XX:MaxGCPauseMillis=100 -XX:+UseAdaptiveSizePolicy -verbose:gc -Xloggc:log/gc.log -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+PrintTenuringDistribution"

JVM_START="-server -Xms2048m -Xmx4096m -Xmn1152m -XX:PermSize=64m -XX:MaxPermSize=128m -XX:MaxDirectMemorySize=1024m -XX:ParallelGCThreads=4"
JVM_START="$JVM_START -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
JVM_START="$JVM_START -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime -XX:+HeapDumpOnOutOfMemoryError -Xloggc:log/flash_gc_$(date +"%Y%m%d%H%M").log"

CLASSPATH="${APP_HOME}:${APP_HOME}/lib/*"

LOG4J2_CONFIG_FILE="${APP_HOME}/config/log4j2.xml"

> ${APP_HOME}/log/app.out
echo "Using APP_HOME:                  $APP_HOME"               > ${APP_HOME}/log/app.out
echo "Using CLASSPATH:                 $CLASSPATH"              >> ${APP_HOME}/log/app.out
echo "Using JVM_START:                 $JVM_START"              >> ${APP_HOME}/log/app.out
echo "Using LOG4J2_CONFIG_FILE:        $LOG4J2_CONFIG_FILE"    >> ${APP_HOME}/log/app.out


#java -classpath $CLASSPATH $JVM_START -DAPP_HOME=${APP_HOME} -Dlog4j.configurationFile=${LOG4J2_CONFIG_FILE} ${MAIN_CLASS} >> ${APP_HOME}/log/app.out 2>&1 & echo $! >$pidFile
java $JVM_START -DAPP_HOME=${APP_HOME} -Dlog4j.configurationFile=${LOG4J2_CONFIG_FILE} -jar ${APP_HOME}/lib/cross-server-1.0-SNAPSHOT.jar >> ${APP_HOME}/log/app.out 2>&1 &
