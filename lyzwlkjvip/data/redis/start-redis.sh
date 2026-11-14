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

APP_HOME=`cd "$PRGDIR" >/dev/null; pwd`

cd $APP_HOME/bin
nohup ./redis-server $APP_HOME/redis-6379.conf >/dev/null 2>&1 &
nohup ./redis-server $APP_HOME/redis-6380.conf >/dev/null 2>&1 &

nohup ./redis-server $APP_HOME/sentinel-26380.conf --sentinel >/dev/null 2>&1 &
#nohup ./redis-server $APP_HOME/sentinel-26381.conf --sentinel &
#nohup ./redis-server $APP_HOME/sentinel-26382.conf --sentinel &



