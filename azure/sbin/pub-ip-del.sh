#!/usr/bin/env bash
sbin="`dirname $0`"
sbin="`cd $sbin; pwd`"
source $sbin/common.sh

load_setting $1 $2

for c in "${cluster_config[@]}"
do
  c=($c)
  public_ip_name=`gen_public_ip_name ${c[1]}`
  cmd="az network public-ip delete -g ${resource_group_name} -n ${public_ip_name}"
  log "Deleting VNet $vm_dns_name in resource group ${resource_group_name}"
  log "Executing: $cmd"
  run_cmd $cmd
done

log "Done deleting Public IP in resource group ${resource_group_name}"
