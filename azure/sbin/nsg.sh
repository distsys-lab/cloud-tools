#!/usr/bin/env bash
sbin="`dirname $0`"
sbin="`cd $sbin; pwd`"
source $sbin/common.sh

load_setting $1

exists=`az group exists --name ${resource_group_name}`
if [ "$exists" == "false" ]; then
  log "Error: resource group ${resource_group_name} does not exist. Create it first."; exit 1
fi


log "Creating NSG in resource group ${resource_group_name}"
for c in "${cluster_config[@]}"
do
  log "Configuring: $c"
  c=($c)
  dc_location="${c[0]}"
  dc_vnet_name=`gen_vnet_name ${c[1]}`
  vm_num=${c[3]}

  for i in `seq $vm_num`
  do
    nsg_name=`gen_nsg_name $i ${c[1]}`
    rule_name=`gen_rule_name iperf ${c[1]}`
    log "Creating VM $vm_name at location ${dc_location} in resource group ${resource_group_name}"
    cmd="az network nsg rule create \
        --resource-group ${resource_group_name} \
        --nsg-name  ${nsg_name} \
        --name ${rule_name} \
        --protocol TCP \
        --priority 1500 \
        --destination-port-range '10000' "

    log "Executing: $cmd"
    run_cmd $cmd


    nsg_name=`gen_nsg_name $i ${c[1]}`
    rule_name=`gen_rule_name icmp ${c[1]}`
    log "Creating VM $vm_name at location ${dc_location} in resource group ${resource_group_name}"
    cmd="az network nsg rule create \
        --resource-group ${resource_group_name} \
        --nsg-name  ${nsg_name} \
        --name ${rule_name} \
        --protocol ICMP \
        --priority 1501 \
        --destination-port-range '*' "
    log "Executing: $cmd"
    run_cmd $cmd
  done
done