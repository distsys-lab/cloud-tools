#!/usr/bin/env bash
source ./global_config.txt

cat global_config.txt >> log.txt
./instance_dispenser.sh
echo setup aws instnces
cd aws
(
./create_my_vpcs_on_all_regions.sh
./list_ami_of_all_regions.sh
./create_and_run_instances_on_all_regions.sh
) >> log.txt 
cd ..

echo setup azure instnces
cd azure 
(
./sbin/create_cluster.sh settings.sh
) >> log.txt 
cd ..

echo setup gcp instnces
cd gcp
(
./create_all_instances.sh
./set_firewall_rules.sh
) >> log.txt 
cd ..

