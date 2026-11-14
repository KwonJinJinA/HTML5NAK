#/bin/sh
source ~/.bash_profile #加载用户环境变量

user="root"
passwd="game10086...A123456..."

server=`ls -a ./ | grep sql | grep -v initsql`
for i in $server;
do
	name=${i%.sql}
	echo $name
	mysql -u$user -p$passwd -e "create database ${name}"
	mysql -u$user -p$passwd $name < ./$i
done

	echo "数据库创建完毕"

