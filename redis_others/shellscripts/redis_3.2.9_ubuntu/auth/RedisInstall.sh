#!/bin/bash
# redis搭建前的准备
# 先将redis的相关脚本传输到服务器的root家目录下
# masterip=`ip addr | sed -n  '/eth0/,+1p' |grep "inet"|awk '{print $2}'|awk -F '/' '{print $1}'`

init_env(){
	apt-get install -y unzip make gcc
	for i in `ps -ef|grep redi[s]|awk '{print $2}'`;do kill -9 $i;done
	rm -rf /alidata/redis
	for i in redisctl redis-master-install redis-slave-install redis-sentinel-install consul-install
	do
		chmod a+x $i &> /dev/null
	done
}

get_ip_port(){
	read -p 'plz input redis master ip:' masterip
	read -p 'plz input redis master port:' masterport
	read -p 'plz input redis master password:' masterpassword
	read -p 'plz input redis slave ip:' slaveip
	read -p 'plz input redis slave port:' slaveport
	
	#masterip=172.19.106.62
	#masterport=6379
	#masterpassword=zyadmin
	#slaveip=172.19.106.62
	#slaveport=6380

}

exec_install(){
	read -p 'Install master or slave or end (m/s/end):' an
	case  $an in
	m)
		./redis-master-install $masterip  $masterport $masterpassword ;;
	s)
		./redis-slave-install $slaveip $slaveport $masterip $masterport $masterpassword ;;
	end)
		break;;
	*)
		echo "plz input m or s!";;
	esac
}

sentinel_config(){
	read -p 'config sentinel (yes or no):' bn
	case $bn in
	yes) 
		read -p 'plz input sentinel port:' sentinelport;
		./redis-sentinel-install $sentinelport $masterip $masterport $masterpassword;;
	no)
		break;;
	*)
		echo "plz input yes or no"
	esac
}

consul_install(){
	read -p 'install consul? (yes or no)': cn
	case $cn in 
	yes)
		./consul-install $masterip $masterport $masterpassword $slaveip $slaveport;;
	no)
		break;;
	*)
		echo "plz input yes or no";;
	esac
}

main(){
	init_env
	get_ip_port
	while true
	do
		exec_install
	done
	while true
	do
		sentinel_config
	done
	while true
	do
		consul_install
	done
}

main
# 启动redis服务
# 启动sentienl服务
# 最后手动启动consul服务并测试
#       nohup /bin/consul agent -dev  -config-dir=/alidata/consul/conf &> /alidata/consul/consul.log &
#       dig redis.service.consul.

