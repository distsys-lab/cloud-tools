#!/usr/bin/env bash
source ./global_config.sh

if [ -z $1 ] || [ -z $2 ]; then
    echo "Error: Argument value is missing.";
    echo "The arguments are 1:cloud name, 2:region name";
    exit 1
fi
echo Creating $1-$2 instance.

if [ $1 = "aws" ]; then
    cd $1
    source ./settings.sh
    region_name=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 1`
    friendly_name=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 3`
    ./create_my_vpc.sh $region_name $friendly_name
    ami=`cat available-images.txt | grep -i $region_name | cut -d ":" -f 2`
    echo -------------------$region_name $friendly_name $ami
    ./run_instance.sh $region_name $friendly_name $ami
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
