#!/usr/bin/env bash
source ./global_config.txt

# $1=cloud_name , $2=region_name 
echo $1-$2

if [ $1="aws" ]; then
    cd $1
    source ./settings.sh
    cat available-regions.txt | grep -i $2 >> my-region-list.txt
    ./list_ami_of_all_regions.sh
    region_name=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 1`
    friendly_name=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 2`
    ./create_my_vpc.sh $region_name $friendly_name
    ami=`grep $region_name $image_list | cut -d ":" -f 2`
    ./run_instance.sh $region_name $friendly_name $ami
    cd ..
elif [ $1="azure"]; then
    cd $1

    cd ..
elif [ $1="gcp"]; then

fi