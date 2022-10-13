#!/usr/bin/env bash
source ./config.sh
IFS=$'
'

regions=$region_list

for i in `cat $regions`
do
	region=`echo $i | cut -d : -f 1`
	name=`echo $i | cut -d : -f 3`

	echo ./delete_my_vpc.sh $region $name
	./delete_my_vpc.sh $region $name
done
