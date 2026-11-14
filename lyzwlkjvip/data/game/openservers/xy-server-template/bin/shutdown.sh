#!/bin/sh
#
#author:lifengyang
#email:lifengyang@pde.com
#
#ulimit -HSn 500000

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

#pidFile="${APP_HOME}/bin/app.pid"
#kill -15 `cat $pidFile`

APP="${APP_HOME}/lib/game-server-1.0-SNAPSHOT.jar"
pkill -f  $APP
#tail -f ${APP_HOME}/log/app.out
