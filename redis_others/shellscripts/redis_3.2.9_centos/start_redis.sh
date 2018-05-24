#!/bin/bash
cd /alidata/redis_3.2.9_centos
#启动redis服务
./redisctl redis start 6379
./redisctl redis start 6380
#启动sentinel服务
./redisctl sentinel start  26379
#启动consul服务
nohup /bin/consul agent -dev  -config-dir=/alidata/consul/conf &> /alidata/consul/consul.log &
#启动dns域名解析服务
systemctl restart named
