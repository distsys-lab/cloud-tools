#!/usr/bin/env bash
sbin="`dirname $0`"
sbin="`cd $sbin; pwd`"
source $sbin/common.sh
echo $1 $2
load_setting $1 $2

# Creates a resource group
$sbin/group.sh $1 $2

# Creates virtual networks
$sbin/vnet.sh $1 $2

# Creates VMs
$sbin/vm.sh $1 $2

# Creates Rule
$sbin/nsg.sh $1 $2

# Lists VM IPs
$sbin/vm-ip.sh $1 $2
