@echo off

rem author wangsheng
rem windows下私服构建脚本，方便测试自己搭建服务器，本机测试

::begin-----------------------------------

set APP_HOME=%~f0\..\..

cd  %APP_HOME%

set JVM_START="-server -Xms3072m -Xmx3072m -Xmn512m -XX:PermSize=64m -XX:MaxPermSize=128m -XX:MaxDirectMemorySize=1024m"
set JVM_START="%JVM_START% -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
set JVM_START="%JVM_START% -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCApplicationStoppedTime "

set CLASSPATH=%APP_HOME%;%APP_HOME%\lib\*

set LOG4J2_CONFIG_FILE="%APP_HOME%\config\log4j2.xml"
set MAIN_CLASS="com.suyu.game.GameServer"
set pidFile="%APP_HOME%\bin\app.pid"

md log

cd log

cd.>app.out


echo "Using CLASSPATH:                 %CLASSPATH%"              >> %APP_HOME%\log\app.out
echo "Using JVM_START:                 %JVM_START%"              >> %APP_HOME%\log\app.out
echo "Using MAIN_CLASS:                %MAIN_CLASS%"             >> %APP_HOME%\log\app.out
echo "Using LOG4J2_CONFIG_FILE:        %LOG4J2_CONFIG_FILE%"    >>  %APP_HOME%\log\app.out
echo "Using PID_FILE:                  %pidFile%"                >> %APP_HOME%\log\app.out


cd %APP_HOME%/lib/

rem >> %APP_HOME%/log/app.out 2>&1 & 

java -jar %APP_HOME%/lib/game-server-1.0-SNAPSHOT.jar 




pause


::end-----------------------------------
