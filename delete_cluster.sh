#!/usr/bin/env bash
#global_configを読み込む
#cluster_configに従って各クラウドツールに命令する
#
source ./global_config.txt


cd aws
./release_all_elastic_ips.sh
./terminate_all_instances.sh
./delete_my_vpcs_on_all_regions.sh
cd ..
#
#cd azure
#./sbin/delete_cluster.sh settings.sh
#cd ..
#
#cd gcp
#./delete_all_instances.sh
#cd ..
