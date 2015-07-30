#!/bin/bash

# NewLand Software:http://www.nlsoft.com.cn
# CreateDate: 2015-06-08
# ModificationDate:2015-06-08
# Author:gongice
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

########
#COMMON#
########

this="${BASH_SOURCE-$0}"
common_bin=$(cd -P -- "$(dirname -- "$this")" && pwd -P)
parent_dir=`cd "$common_bin/../" >/dev/null; pwd`
conf=`cd "$common_bin/../conf" >/dev/null; pwd`
log=`cd "$common_bin/../log" >/dev/null; pwd`

#
#script_name=""
user_name="hadoop"
#如果没有参数传入，退出                                         
if [ $# -lt 1 ] ; then                                          
        echo "Usage: $0 执行脚本的主机 脚本名 \"脚本运行参数\""            
        echo "e.g.: $0 hadoop02 script.sh \"arg1  arg2\""                  
        exit 1;                                                 
fi

#for server in "${servers[@]}"; { scp script.sh $server:/tmp/script.sh && ssh cacher@$server "bash /tmp/script.sh && rm /tmp/script.sh"}

scp $common_bin/$2 $1:$common_bin/$2 && ssh $user_name@$1 "bash $common_bin/$2 $3 && rm $common_bin/$2"
#scp $common_bin/$2 $1:$common_bin/$2 && ssh $user_name@$1 "bash $common_bin/$2 $3"

