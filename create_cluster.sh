#!/usr/bin/env bash
#global_configを読み込む
#cluster_configに従って各クラウドツールに命令する
#
source ./global_config.txt


./instance_dispenser.sh
#cd aws
#./create_my_vpcs_on_all_regions.sh
#./list_ami_of_all_regions.sh
#./create_and_run_instances_on_all_regions.sh
#cd ..

cd azure 

