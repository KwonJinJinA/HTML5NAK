!/bin/sh
#
#author:lifengyang
#email:xffforever@gmail.com
#
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

cd $APP_HOME

JVM_START="-server -Xms1024m -Xmx3072m -Xmn512m -XX:PermSize=64m -XX:MaxPermSize=128m -XX:MaxDirectMemorySize=128m"
JVM_START="$JVM_START -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
JVM_START="$JVM_START -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime -XX:+HeapDumpOnOutOfMemoryError -Xloggc:log/flash_gc_$(date +"%Y%m%d%H%M").log"

CLASSPATH="${APP_HOME}:${APP_HOME}/lib/*"

LOG4J2_CONFIG_FILE="${APP_HOME}/log4j2.xml"
MAIN_CLASS="com.xuanqing.Log2dbStart"
pidFile="$APP_HOME/bin/app.pid"

java -classpath $CLASSPATH $JVM_START -DAPP_HOME=${APP_HOME} -Dlog4j.configurationFile=${LOG4J2_CONFIG_FILE} ${MAIN_CLASS} & echo $! >$pidFile
