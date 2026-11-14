#!/bin/sh
#ulimit -HSn 65534
Time=`date "+%Y%m%d%H%M%S"`
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

JVM_START="-server -Xms1024m -Xmx2048m -Xmn384m -XX:PermSize=128m -XX:MaxPermSize=256m -XX:CMSInitiatingOccupancyFraction=75 "
JVM_START="$JVM_START -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
JVM_START="$JVM_START -XX:+TieredCompilation"
JVM_START="$JVM_START -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime -XX:+HeapDumpOnOutOfMemoryError -Xloggc:log/flash_gc_$(date +"%Y%m%d%H%M").log"

CLASSPATH="${APP_HOME}:${APP_HOME}/lib/*"

LOG4J2_CONFIG_FILE="${APP_HOME}/config/log4j2.xml"
MAIN_CLASS="com.suyu.game.GameServer"
pidFile="$APP_HOME/bin/app.pid"
> ${APP_HOME}/log/app.out
echo "Using APP_HOME:                  $APP_HOME"               > ${APP_HOME}/log/app.out
echo "Using CLASSPATH:                 $CLASSPATH"              >> ${APP_HOME}/log/app.out
echo "Using JVM_START:                 $JVM_START"              >> ${APP_HOME}/log/app.out
echo "Using MAIN_CLASS:                $MAIN_CLASS"             >> ${APP_HOME}/log/app.out
echo "Using LOG4J2_CONFIG_FILE:        $LOG4J2_CONFIG_FILE"    >> ${APP_HOME}/log/app.out
echo "Using PID_FILE:                  $pidFile"                >> ${APP_HOME}/log/app.out

java $JVM_START -DAPP_HOME=${APP_HOME} -Dlog4j.configurationFile=${LOG4J2_CONFIG_FILE} -jar ${APP_HOME}/lib/game-server-1.0-SNAPSHOT.jar >>${APP_HOME}/log/app.out 2>&1 &
