#!/usr/bin/env bash
sbin="`dirname $0`"
sbin="`cd $sbin; pwd`"
source $sbin/common.sh
echo $1 $2
load_setting $1
if [ -n "$2" ]; then
    cluster_config=()
    line=`cat available-regions.txt | grep -i $2`
    location=`echo $line | cut -d ":" -f 1`
    tag=`echo $line | cut -d ":" -f 2`
    vnet_ip=`echo $line | cut -d ":" -f 3`
    num=`echo $line | cut -d ":" -f 4`
    cluster_config+=("$location $tag $vnet_ip $num")
fi

# Creates a resource group
$sbin/group.sh $1

# Creates virtual networks
$sbin/vnet.sh $1

# Creates VMs
$sbin/vm.sh $1

# Creates Rule
$sbin/nsg.sh $1

# Lists VM IPs
$sbin/vm-ip.sh $1
