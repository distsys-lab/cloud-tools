#!/usr/bin/env bash

for r in `./list_instances_on_all_regions.sh`
do
	region=`echo $r | cut -d : -f 1`
	instance=`echo $r | cut -d : -f 3`

	if [ x$instance = x ]; then
		echo skip ${region}, since any instance does not exist
		continue
	fi
	
	./disassociate_and_release_eip.sh $region $instance
done
