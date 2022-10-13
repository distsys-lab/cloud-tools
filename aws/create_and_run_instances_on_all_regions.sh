#!/usr/bin/env bash
source ./config.sh
regions=$region_list
images=$image_list
for r in `cat $regions | cut -d : -f 1`
do
	ami=`grep $r $images | cut -d : -f 2`
	friendly_name=`grep $r $regions | cut -d : -f 3`
	
	echo "==== Run a instance on $r ===="
	./run_instance.sh $r $friendly_name $ami
done
