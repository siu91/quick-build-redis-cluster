#!/bin/bash

# CreateDate: 2015-05-28
# ModificationDate:2015-05-28
# Author:gongice
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

this="${BASH_SOURCE-$0}"
common_bin=$(cd -P -- "$(dirname -- "$this")" && pwd -P)
conf=`cd "$common_bin/../conf" >/dev/null; pwd`
log=`cd "$common_bin/../log" >/dev/null; pwd`

#如果没有参数传入，退出                                         
if [ $# -lt 1 ] ; then                                          
        echo "Usage: $0 port1 port2 port3 portN ..."            
        echo "e.g.: $0 6739"                  
        exit 1;                                                 
fi  

#根据port初始化node                                                           
for port in $@                                                  
do
redis-server $conf/redis-$port.conf > $log/redis-$port.log 2>&1 &
done
