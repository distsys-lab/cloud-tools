#!/usr/bin/env bash
source ./global_config.sh

if [ -z $1 ] || [ -z $2 ]; then
    echo "Error: Argument value is missing.";
    echo "The arguments are 1:cloud name, 2:region name";
    exit 1
fi
echo Stoping $1-$2 instance.

if [ $1 = "aws" ]; then
    cd $1
    source ./settings.sh
    region_name=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 1`
    id=`./list_instances_on_all_regions.sh | grep $region_name | cut -d ":" -f 3`
    ./stop_instance.sh $region_name $id
    cd ..
elif [ $1 = "azure" ]; then
    cd $1
    ./sbin/create_cluster.sh settings.sh $2
    cd ..
elif [ $1 = "gcp" ]; then
    cd $1
    source ./settings.sh
    tag=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 2`
    zone=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 1`
    ./create_instance.sh $tag $zone $machine_type
    cd ..
fi
