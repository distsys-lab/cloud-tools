#!/usr/bin/env bash
source ./global_config.sh

if [ -z $1 ] || [ -z $2 ]; then
    echo "Error: Argument value is missing.";
    echo "The arguments are 1:cloud name, 2:region name";
    exit 1
fi
echo Deleting $1-$2 instance.

if [ $1 = "aws" ]; then
    cd $1
    source ./settings.sh
    line=`./list_instances_on_all_regions.sh | grep -i $2 | grep -i running`
    region=`echo $line | cut -d : -f 1`
    instance=`echo $line | cut -d : -f 3`
    ./disassociate_and_release_eip.sh $region $instance
    ./terminate_instance.sh $region $instance
    while true
    do
    	flag=1
    	for r in `./list_instances_on_all_regions.sh | grep -i $2`
    		do
    			state=`echo $r | cut -d : -f 4`
    			if [ $state != "terminated" ]; then
    				flag=1
    				break
    			fi
    			flag=0
    		done
    	./list_instances_on_all_regions.sh
    	if [ $flag -eq 0 ]; then
    		break
    	fi
    	echo "Waiting for the instance state to terminated"
    done
    line=`cat available-regions.txt | grep -i $2`
	region=`echo $line | cut -d : -f 1`
	name=`echo $line | cut -d : -f 3`
    ./delete_my_vpc.sh $region $name
    cd ..
elif [ $1 = "azure" ]; then
    cd $1
    ./sbin/delete_cluster.sh settings.sh $2 
    cd ..
elif [ $1 = "gcp" ]; then
    cd $1
    source ./settings.sh
    tag=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 2`
    zone=`cat available-regions.txt | grep -i $2 | cut -d ":" -f 1`
    ./delete_instance.sh $tag $zone
    cd ..
fi
