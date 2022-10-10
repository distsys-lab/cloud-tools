#!/usr/bin/env bash
#global_configを読み込む
#cluster_configに従って各クラウドツールに命令する
#
source ./global_config.txt


cd aws
./terminate_all_instances.sh
./release_all_elastic_ips.sh
./delete_my_vpcs_on_all_regions.sh
cd ..
