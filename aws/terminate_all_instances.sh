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

# Wait for the instance to terminate
while true
do
	flag=1
	none_instance=0
	for r in `./list_instances_on_all_regions.sh`
		do
			none_instance=1
			state=`echo $r | cut -d : -f 4`
			if [ $state != "terminated" ]; then
				flag=1
				break
			fi
			flag=0
		done
	if [ $flag -eq 0 ] || [	$none_instance -eq 0 ]; then
		break
	fi
	echo "Waiting for the instance state to terminated"
done