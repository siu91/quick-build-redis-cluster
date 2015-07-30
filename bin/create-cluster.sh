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

#redis-trib.rb的create子命令构建  
#--replicas 则指定了为Redis Cluster中的每个Master节点配备几个Slave节点  
#节点角色由顺序决定,先master之后是slave(为方便辨认,slave的端口比master大1000)
command="/usr/lib/redis/redis-3.0.1/src/redis-trib.rb create --replicas 1"
ports="7001 7002 7003 7004 8001 8002 8003 8004"
ip1="192.168.1.101 192.168.1.102 192.168.1.103 192.168.1.104"
ip2="192.168.1.104 192.168.1.101 192.168.1.102 192.168.1.103"

declare -a port_array
declare -a ip_array

port_array=($ports)
ip_array=($ip1 $ip2)
separator=" "
ip_port=""
#echo ${#ip_array[@]}
for (( i=0; i<${#port_array[@]}; i++ )) ;
do
ip_port=$ip_port${ip_array[$i]}:${port_array[$i]}$separator
#echo ${ip_array[$i]}:${port_array[$i]}
done
echo $ip_port
#$command 192.168.1.101:7001 192.168.1.102:7002 192.168.1.103:7003 192.168.1.104:7004 192.168.1.104:8001 192.168.1.101:8002 192.168.1.102:8003 192.168.1.103:8004
$command $ip_port
