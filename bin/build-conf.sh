#!/bin/bash

# CreateDate: 2015-05-28
# ModificationDate:2015-05-28
# Author:gongice
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

this="${BASH_SOURCE-$0}"
common_bin=$(cd -P -- "$(dirname -- "$this")" && pwd -P)
parent_dir=`cd "$common_bin/../" >/dev/null; pwd`
conf=`cd "$common_bin/../conf" >/dev/null; pwd`
log=`cd "$common_bin/../log" >/dev/null; pwd`

#如果没有参数传入，退出                                         
if [ $# -lt 1 ] ; then                                          
        echo "Usage: $0 port1 port2 port3 portN ..."            
        echo "e.g.: $0 6739"                  
        exit 1;                                                 
fi  
 
#根据port建立配置文件                                                           
for port in $@                                                  
do
if [ ! -d $parent_dir/$port ]; then
#创建port文件夹
mkdir $parent_dir/$port
fi
#1#  
#拷贝redis-example.conf
#cp $conf/redis-example.conf $conf/redis-$port.conf
#替换字符
#sed -i "s/0000/$port/g" `grep 0000 -rl $conf/redis-$port.conf`
#2#
>$conf/redis-$port.conf
echo 'include '$conf'/redis-common.conf' >>$conf/redis-$port.conf
echo 'pidfile /var/run/redis-'$port'.pid' >>$conf/redis-$port.conf
echo 'port '$port >>$conf/redis-$port.conf >>$conf/redis-$port.conf
echo 'logfile '$log'/redis-'$port'.log' >>$conf/redis-$port.conf
echo 'dbfilename dump-'$port'.rdb' >>$conf/redis-$port.conf
echo 'dir '$parent_dir'/'$port >>$conf/redis-$port.conf
echo 'cluster-config-file '$parent_dir'/'$port'/nodes.conf' >>$conf/redis-$port.conf
echo 'appendfilename appendonly-'$port'.aof' >>$conf/redis-$port.conf
done
