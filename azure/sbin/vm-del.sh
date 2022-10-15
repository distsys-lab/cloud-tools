#!/usr/bin/env bash
sbin="`dirname $0`"
sbin="`cd $sbin; pwd`"
source $sbin/common.sh

load_setting $1 $2

for c in "${cluster_config[@]}"
do
  c=($c)
  vm_name=`gen_vm_name ${c[1]}`
  dc_vnet_name=`gen_vnet_name ${c[1]}`
  cmd="az vm delete --resource-group ${resource_group_name} --name ${vm_name} --yes"
  log "Deleting VNet $vm_name in resource group ${resource_group_name}"
  log "Executing: $cmd"
  run_cmd $cmd
done

log "Done deleting Vm in resource group ${resource_group_name}"
