#!/bin/sh

IFS='
'

hosts=hosts_list.txt
program_dir=../library

if [ ! -f $hosts ]; then
	echo "Error: $hosts not found. Generate this first using check_hosts_ip.sh."
	exit 1
fi

for i in `cat $hosts`
do
	user=`echo $i | cut -d : -f 1`
	hostip=`echo $i | cut -d : -f 3`

	rsync -av --delete --exclude=.git --exclude='*.java' --exclude='*.class' --exclude='*.swp' $program_dir $user@$hostip:
done


