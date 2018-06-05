# 批量删除redis的key

> 2018-02-27 驻云DBA组

[TOC]



## 需求

redis数据清理：

目前在0号库中，存在一个hash键mserver_redis_requestUk，数据量达到20G左右，需要在不影响生成环境的情况下，删除该Key。


## 解决方法

### 思路

从Redis2.8版本开始支持HSCAN命令，通过m次时间复杂度为O(1)的方式，遍历包含n个元素的大key。

**这样可以避免单个O(n)的大命令，从而避免Redis阻塞。 **



HSCAN 命令返回的每个元素都是一个键值对，一个键值对由一个键和一个值组成。



### 具体操作 

通过hscan命令，每次获取500个字段，再用hdel命令，每次删除1个字段。
Python代码：

```shell
# -*- coding:utf-8 -*-
import redis

def del_large_hash():
    r = redis.StrictRedis(host='云redis地址', port=6379, password='密码')
    large_hash_key ="mserver_redis_requestUk" #要删除的大hash键名
    cursor = '0'
    cursor, data = r.hscan(large_hash_key, cursor=cursor, count=500)
    for item in data.items():
        r.hdel(large_hash_key, item[0])

del_large_hash()
```

* 准备一台ECS服务器可以访问云redis
* python 版本 >= 2.7
* 安装python的redis包，命令如下

```shell
pip install redis
```

准备好环境和脚本后，就可以优雅的删除大Key了。

## 总结

* 该方法每次获取500个字段，再用hdel命令，每次删除1个字段；


* 通过m次时间复杂度为O(1)的方式，遍历大key`mserver_redis_requestUk`；


* m=大key的总字段/500 ；


* 每次获取的字段数，可以在脚本中自行调整。

**Hscan实现增量迭代从而避免Redis阻塞。 **




