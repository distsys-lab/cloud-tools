#!/usr/bin/env bash
source ./global_config.txt

echo delete aws instances
cd aws
(
./release_all_elastic_ips.sh
./terminate_all_instances.sh
./delete_my_vpcs_on_all_regions.sh
) >> aws.log 
cd ..

echo delete azure instances
cd azure
(
./sbin/delete_cluster.sh settings.sh
) >> azure.log 
cd ..

echo delete gcp instances
cd gcp
(
./delete_all_instances.sh
) >> gcp.log
cd ..
