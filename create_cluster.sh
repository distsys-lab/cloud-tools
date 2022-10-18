#!/usr/bin/env bash
source ./global_config.sh

./instance_dispenser.sh
(
    cd aws
    (
        ./create_my_vpcs_on_all_regions.sh
        ./list_ami_of_all_regions.sh
        ./create_and_run_instances_on_all_regions.sh
    ) >> aws.log 
    cd ..
) &
pid1=${!}

(
    cd azure 
    (
        ./sbin/create_cluster.sh settings.sh
    ) >> azure.log
    cd ..
) &
pid2=${!}

(
    cd gcp
    (
    ./create_all_instances.sh
    ./set_firewall_rules.sh
    ) >> gcp.log 
    cd ..
) &
pid3=${!}

wait ${pid1} ${pid2} ${pid3}
echo "Done create cluster"