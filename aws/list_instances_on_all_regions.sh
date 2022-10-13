#!/usr/bin/env bash

regions=`cat config.txt | grep '^region_list' | cut -d '=' -f 2-`

group_name=`cat config.txt | grep '^name_prefix' | cut -d '=' -f 2-`
filter="--filters Name=\"tag:Group\",Values=\"$group_name\""
if [ $# -ge 1 -a x$1 = xany ]; then
	filter=
fi

for r in `cat $regions | cut -d : -f 1`
do
	city=`cat $regions | grep $r | cut -d : -f 3`
	instances_state=`aws --region $r ec2 describe-instances $filter | \
		jq ".Reservations[].Instances[].State.Name" | \
		sed 's/"//g' | xargs | sed 's/ /:/g'`
	instances_id=`aws --region $r ec2 describe-instances $filter | \
		jq ".Reservations[].Instances[].InstanceId" | \
		sed 's/"//g' | xargs | sed 's/ /:/g'`
	instances_ip=`aws --region $r ec2 describe-instances $filter | \
		jq ".Reservations[].Instances[].PublicIpAddress" | \
		sed 's/"//g' | xargs | sed 's/ /:/g'`
	index=1
	for i in `echo $instances_id | sed 's/:/\n/g'`
	do
		state=`echo $instances_state | cut -d ":" -f $index`
		ip=`echo $instances_ip | cut -d ":" -f $index`
		((index++))
		echo $r:$city:$i:$state:$ip
	done
done
