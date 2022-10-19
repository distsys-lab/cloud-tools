source ../global_config.sh
## Resource group settings
resource_group_name=$resource_name_prefix
## Location options: az account list-locations --output table
## uses the value under name / Name
resource_group_location="eastus2"

## Virtual network settings
vnet_mask="16"
vnet_subnet_mask="24"
vnet_subnet_name="Subnet1"

## Virtual machine settings
## VM public key file for login, which must corresponds to the private key that
## is configured on Azure for VM logins.
vm_public_key=$ssh_pubkey_path
## VM username
vm_username=$azure_vm_username
## VM image options: az vm image list --output table
## Uses the value under Urn or UrnAlias
vm_image="Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest" #"UbuntuLTS"
## VM size options are different across locations: az vm list-sizes --location <location> --output table
## Uses the value under name / Name
vm_size="Standard_B1s"
# Accelerated Network Options: true for Standard_D4_v3
vm_acc_network="false"
## Disk options:
## Standard_LRS (for HDD)
## Premium_LRS 
## StandardSSD_LRS (for standard SSD)
## UltraSSD_LRS
vm_disk_type="StandardSSD_LRS"

## Optional configurations
## vm_dns=true to set a DNS for each VM
vm_dns="false"
## DNS format: ${vm_name}-dns.${location}.${vm_dns_suffix}
## Suffix cannot be changed
vm_dns_suffix="cloudapp.azure.com"
## vm_no_wait=true to create VMs in the background. When this is enabled, if
## Azure fails to create a VM, the error information will not be displyed by
## Azure CLI.
vm_no_wait="false"

# Cluster Config
### It can be easily created with cp available-regions.txt my-region-list.txt
### Describe the cluster settings in "my-region-list.txt" in the following format.
### region_name:tag_name:vNetIP
### region_name:tag_name:vNetIP
### region_name:tag_name:vNetIP
cluster_config=()
while read line
do
    location=`echo $line | cut -d ":" -f 1`
    tag=`echo $line | cut -d ":" -f 2`
    vnet_ip=`echo $line | cut -d ":" -f 3`
    cluster_config+=("$location $tag $vnet_ip")
done < my-region-list.txt
