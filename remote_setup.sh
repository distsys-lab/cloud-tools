#!/bin/sh

IFS='
'

hosts=hosts_list.txt

if [ ! -f $hosts ]; then
	echo "Error: $hosts not found. Generate this first using check_hosts_ip.sh."
	exit 1
fi

for i in `cat $hosts`
do
	user=`echo $i | cut -d : -f 1`
	hostip=`echo $i | cut -d : -f 3`

	ssh -oStrictHostKeyChecking=no -l $user $hostip sudo apt update
	ssh -oStrictHostKeyChecking=no -l $user $hostip sudo apt install -y zsh lv screen default-jre-headless iperf3
	ssh -oStrictHostKeyChecking=no -l $user $hostip sudo chsh -s /bin/zsh $user
	scp ~/.vimrc.compat $user@$hostip:.vimrc
	scp ~/.zshrc $user@$hostip:.zshrc
done


