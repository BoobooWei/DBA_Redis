# 喜盈门redis迁移合并

> 2018-06-22 大宝

[TOC]

## 需求

目前client中存在db0，db1，db2，test库中存在db0，db1。
客户希望将test库中的数据与client合并，且不覆盖client库。


## 调研情况

目前test中存在db0，db1，client中也有db0，db1。

```shell
# client Keyspace
db0:keys=186,expires=4,avg_ttl=6348143
db1:keys=192,expires=9,avg_ttl=281534
db2:keys=1,expires=0,avg_ttl=0


# test Keyspace
db0:keys=25113,expires=103,avg_ttl=31130691210
db1:keys=954,expires=0,avg_ttl=0
```



1. 合并两个库，目前客户是否使用了命名空间，来区分key呢？

2. 若客户使用了命名空间，则合并可以保证数据一致性，合并方法使用逻辑备份和导入即可：redis-dump 和redis-load命令

3. 若客户没有使用命名空间，则合并时遇到有冲突的key，会自动跳过，只保留目标库中的key，导致数据不一致。需要客户判断是否能够接受数据的不一致性。


**客户反馈key的命名空间有些有，有些没有。因此请客户考虑上述第三点。**

**A**: 可以接受数据不一致，冲突时保留目标库的key

## 迁移数据

```
# 备份test
[root@xym-csos-server ~]# redis-dump -u :6FtkIazwqzC@r-bp114417c5d282b4.redis.rds.aliyuncs.com:6379 > redis_test.json

# 为了保险也备份client
[root@xym-csos-server ~]# redis-dump -u :KIU495bIqL@r-bp1cdd51ee8a8824.redis.rds.aliyuncs.com:6379 > redis-client.json


[root@xym-csos-server ~]# ll -h
total 42M
-rw-r--r-- 1 root root 602K Jun 22 22:03 redis-client.json
-rw-r--r-- 1 root root  42M Jun 22 22:03 redis_test.json
-rwxr-xr-x 1 root root 5.0K Jun 21 14:30 zabbix_proxy-3.2.1.sh

# 将test导入client，报错utf8编码问题

[root@xym-csos-server ~]# redis-load -u :xxx@r-bp1cdd51ee8a8824.redis.rds.aliyuncs.com:6379 < redis_test.json 
ERROR (Yajl::ParseError): lexical error: invalid bytes in UTF8 string.
          ","value":"\u0000\u000F\u0004󮮰BappHostName󮮰B10.10.
                     (right here) ------^
					 

#如果报错，请使用-n选项，使用请参考官方，请谨慎使用！
#< test.json redis-load -n    //-n （以二进制形式导入）

Loading data with binary strings
If you have binary or serialized data in your Redis database, the YAJL parser may not load your dump file because it sees some of the binary data as 'invalid bytes in UTF8 string'. If you are certain that your data is binary and not malformed UTF8, you can use the -n flag to redis-load to tell YAJL to not check the input for UTF8 validity. Use with caution!

# 添加-n参数以二进制方式导入

[root@xym-csos-server ~]# redis-load -n -u :xxx@r-bp1cdd51ee8a8824.redis.rds.aliyuncs.com:6379 < redis_test.json 

# 查看当前的client情况如下

r-bp1cdd51ee8a8824.redis.rds.aliyuncs.com:6379>info
# Server
redis_version:2.8.19
redis_git_sha1:84975300
redis_git_dirty:1
redis_build_id:716ab38e57364d4
redis_mode:standalone
os:Linux  
arch_bits:64
multiplexing_api:epoll
gcc_version:0.0.0
process_id:51718
run_id:36c0d2baa517fad865786cff19a3b00d1497981a
server_id:0
tcp_port:6379
uptime_in_seconds:2362924
uptime_in_days:27
hz:10
lru_clock:2949784
config_file:redis.conf
# Clients
connected_clients:75
client_longest_output_list:0
client_biggest_input_buf:0
blocked_clients:0
# Memory
used_memory:34908112
used_memory_human:33.29M
used_memory_rss:34844672
used_memory_peak:35549288
used_memory_peak_human:33.90M
used_memory_lua:45056
mem_fragmentation_ratio:1.00
mem_allocator:jemalloc-3.6.0
# Stats
total_connections_received:524441
total_commands_processed:25328930
instantaneous_ops_per_sec:6
total_net_input_bytes:1092820494
total_net_output_bytes:6478654065
instantaneous_input_kbps:0.11
instantaneous_output_kbps:2.47
input_limit_tokens:31457280
output_limit_tokens:31457275
input_strict_limit:0
output_strict_limit:0
rejected_connections:0
rejected_connections_status:0
sync_full:0
sync_partial_ok:0
sync_partial_err:0
expired_keys:116358
evicted_keys:0
evicted_keys_per_sec:0
keyspace_hits:1521054
keyspace_misses:759414
hits_per_sec:0.00
misses_per_sec:0.00
hit_rate_percentage:100.00
pubsub_channels:0
pubsub_patterns:66
latest_fork_usec:692
traffic_control_read:0
traffic_control_read_status:0
traffic_control_write:0
traffic_control_write_status:0
total_bigkeys:0
bigkeys_status:0
stat_avg_rt:0
stat_max_rt:867
# CPU
used_cpu_sys:1394.92
used_cpu_user:1545.75
used_cpu_sys_children:0.06
used_cpu_user_children:0.06
# Keyspace
db0:keys=25302,expires=110,avg_ttl=19648674653
db1:keys=1089,expires=3,avg_ttl=2588349
db2:keys=1,expires=0,avg_ttl=0
# Cluster
databases:256
nodecount:1
# SSL
ssl_enabled:0
ssl_protocols:TLSv1,TLSv1.1,TLSv1.2
ssl_client_count:0
ssl_accept_count:0
ssl_reject_count:0
```


## 总结

1. 物理备份恢复redis-port reload代表全量导入；sync代表全量加增量 
2. 逻辑备份恢复redis-dump redis-load