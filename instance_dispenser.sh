#!/usr/bin/env bash
source ./global_config.txt

for i in aws azure gcp;
do
    : > $i/my-region-list.txt
done

for i in ${cluster_config[@]};
do
    cloud=`echo $i | cut -d ',' -f 1`
    region=`echo $i | cut -d ',' -f 2`
    cat $cloud/available-regions.txt | grep -i $region >> $cloud/my-region-list.txt
done