#!/bin/sh

if [ $# -lt 1 ]; then
	echo 'usage: hostip'
	exit 1
fi

hostip=$1
user=`cat clouds_hosts.txt | grep $hostip | cut -d ':' -f 1`


program_dir=../../bft-smart-mod

ssh -oStrictHostKeyChecking=no -l $user $hostip sudo apt-get update
ssh -oStrictHostKeyChecking=no -l $user $hostip sudo apt-get install -y zsh lv screen default-jre-headless iperf3
ssh -oStrictHostKeyChecking=no -l $user $hostip sudo chsh -s /bin/zsh $user
scp ~/.vimrc.compat $user@$hostip:.vimrc
scp ~/.zshrc $user@$hostip:.zshrc
rsync -av --delete --exclude=.git --exclude='*.java' --exclude='*.class' --exclude='*.swp' $program_dir $user@$hostip:
