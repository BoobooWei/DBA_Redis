# 报错

[TOC]

## RDB失败以及AOF文件异常大

### 报错原因

```shell
redis从库报错：
7022:S 23 Jul 21:30:10.681 * Starting automatic rewriting of AOF on 232547% growth
7022:S 23 Jul 21:30:10.681 # Can't rewrite append only file in background: fork: Cannot allocate memory
```

### 原因和解决

在线关闭从库aof功能

```shell
172.16.1.167:6379> CONFIG SET appendonly no
OK
```

删除aof文件

```shell
rm ‐rf appendonly.aof
```


从库无法固化以及aof文件出错原因
当Redis内存使用量约超过物理内存一半时，Redis在fork进程进行bgsave或者BGREWRITEAOF时将会失败，此时无法rdb持久化以及AOF rewrite，通常在日志中可以看到：
`Can't save in background: fork: Cannot allocate memory`
这种情况，可以将Linux的`vm.overcommit_memory = 1`，但理论上也会存在风险，如果在rdb dump期间业务有相当多的数据更新，将会导致系统内存不足而发生OOM
所以如果业务无需固化数据，直接将rdb和aof都关闭即可。

## MISCONF

### 报错明细

```shell
MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error.
```

### 原因和解决

其原因是因为强制把`redis`快照关闭了导致不能持久化的问题，在网上查了一些相关解决方案，通过`stop-writes-on-bgsave-error`值设置为`no`即可避免这种问题。

有两种修改方法，一种是通过redis命令行修改，另一种是直接修改redis.conf配置文件

命令行修改方式示例：

`127.0.0.1:6379> config set stop-writes-on-bgsave-error no`

修改`redis.conf`文件：`stop-writes-on-bgsave-error`字符串所在位置，接着把后面的`yes`设置为`no`即可。