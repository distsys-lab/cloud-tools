#!/usr/bin/env bash
#global_configを読み込む
#cluster_configに従って各クラウドツールに命令する
#
source ./global_config

./aws/create_my_vpcs_on_all_regions.sh