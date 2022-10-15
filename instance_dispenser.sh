#!/usr/bin/env bash
source ./global_config.txt

for i in ${cloud_list[@]};
do
    : > $i/my-region-list.txt
done

for i in ${cluster_config[@]};
do
    cloud=`echo $i | cut -d ',' -f 1`
    region=`echo $i | cut -d ',' -f 2`
    if [ $cloud = "aws" ] || [ $cloud = "azure" ] || [ $cloud = "gcp" ]; then
        :
    else
        echo Error: The specified cloud name is invalid.
        exit 1
    fi
    cat $cloud/available-regions.txt | grep -i $region >> $cloud/my-region-list.txt
done

