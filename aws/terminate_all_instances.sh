#!/usr/bin/env bash

for r in `./list_instances_on_all_regions.sh`
do
	region=`echo $r | cut -d : -f 1`
	instance=`echo $r | cut -d : -f 3`

	if [ x$instance = x ]; then
		echo skip ${region}, since any instance does not exist
		continue
	fi
	
	./terminate_instance.sh $region $instance
done

while true
do
	flag=1
	for r in `./list_instances_on_all_regions.sh`
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