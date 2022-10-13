#!/usr/bin/env bash
source ./global_config.txt

./instance_dispenser.sh
echo setup aws instnces
cd aws
(
./create_my_vpcs_on_all_regions.sh
./list_ami_of_all_regions.sh
./create_and_run_instances_on_all_regions.sh
) >> aws.log 
cd ..

echo setup azure instnces
cd azure 
(
./sbin/create_cluster.sh settings.sh
) >> azure.log 
cd ..

echo setup gcp instnces
cd gcp
(
./create_all_instances.sh
./set_firewall_rules.sh
) >> gcp.log 
cd ..

