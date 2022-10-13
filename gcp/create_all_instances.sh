#!/usr/bin/env bash

source ./settings.sh

for i in "${cluster_config[@]}"
do
	tag=`echo $i | cut -d ":" -f 2`
	zone=`echo $i | cut -d ":" -f 1`
	./create_instance.sh $tag $zone $machine_type
done
