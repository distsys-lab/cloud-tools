#!/usr/bin/env bash
sbin="`dirname $0`"
sbin="`cd $sbin; pwd`"
source $sbin/common.sh

load_setting $1 $2

for c in "${cluster_config[@]}"
do
  c=($c)
  nsg_name=`gen_nsg_name ${c[1]}`
  cmd="az network nsg delete -g ${resource_group_name} -n ${nsg_name}"

  log "Deleting VNet $dc_vnet_name in resource group ${resource_group_name}"
  log "Executingu: $cmd"
  run_cmd $cmd
done

log "Done deleting Nsg in resource group ${resource_group_name}"
