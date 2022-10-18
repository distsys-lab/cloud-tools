#!/usr/bin/env bash
source ./global_config.sh

(
    cd aws
    (
        ./release_all_elastic_ips.sh
        ./terminate_all_instances.sh
        ./delete_my_vpcs_on_all_regions.sh
    ) >> aws.log 
    cd ..
) &
pid1=${!}

(
    cd azure
    (
        ./sbin/delete_cluster.sh settings.sh
    ) >> azure.log 
    cd ..
) &
pid2=${!}

(
    cd gcp
    (
        ./delete_all_instances.sh
    ) >> gcp.log
    cd ..
) &
pid3=${!}

wait ${pid1} ${pid2} ${pid3}
echo "Done delete cluster"