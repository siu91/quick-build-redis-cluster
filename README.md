# quick-build-redis-cluster
##快速搭建Redis集群

###生成配置文件：
$ ./bin/build-conf.sh port_list
###初始化节点：
$ ./bin/build-conf.sh port_list
###远程主机上生成配置文件和初始化节点：
$ ./running-script-on-remote-machines.sh hostname script port_list
###构建集群：
$ ./bin create-cluster.sh master slave port
