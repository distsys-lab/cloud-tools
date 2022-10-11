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
    if [ $cloud="aws" ]; then
        index=1
    elif [ $cloud="azure" ]; then
        index=2
    elif [ $cloud="gcp" ]; then
        index=3
    else
        echo not found cloud
        exit 1
    fi
    region_name=`cat regions.csv | grep $region | cut -f $index`
    cat $cloud/available-regions.txt | grep -i $region_name >> $cloud/my-region-list.txt
done

