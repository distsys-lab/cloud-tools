#!/usr/bin/env bash
sbin="`dirname $0`"
sbin="`cd $sbin; pwd`"
source $sbin/common.sh

load_setting $1 $2

$sbin/vm-del.sh $1 $2

$sbin/vnet-del.sh $1 $2

$sbin/nsg-del.sh $1 $2

$sbin/pub-ip-del.sh $1 $2
