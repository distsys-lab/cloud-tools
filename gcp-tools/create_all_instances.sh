#!/usr/bin/env bash

source ./config.txt

for i in ${cluster_config[@]};
do
	zone=`echo $i | cut -d ',' -f 2`
	tag=`echo $i | cut -d ',' -f 1`
	./create_instance.sh $tag $zone $machine_type
done
