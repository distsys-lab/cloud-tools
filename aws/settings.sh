source ../global_config.sh
# this prefix will be added to all resources that will be created
name_prefix=my-bft
if [ -n $resource_name_prefix ]; then
    name_prefix=$resource_name_prefix
fi
# the name of a key pair that will be created
keypair_name=my-keypair
if [ -n $resource_name_prefix ]; then
    keypair_name=$resource_name_prefix
fi
# the path to your public key, which will be used as your aws key pair
pubkey_path=$HOME/.ssh/id_rsa.pub
if [ -n $ssh_pubkey_path ]; then
    keypair_path=$ssh_pubkey_path
fi
# The host's user name. Do not change this.
vm_username=ubuntu
if [ -n $aws_vm_username ]; then
    vm_username=$aws_vm_username
fi
# instance type
### Choose this carefully. Some machine cannot be used in certain areas.
instance_type=t3.micro
# OS Image type
### Choose this carefully. Some images cannot be used in certain areas.
os_image_type="Canonical, Ubuntu, 20.04 LTS, amd64 focal image build on "
# a list of regions where this toolset manages
region_list=my-region-list.txt
# a list of OS image IDs for your instances
image_list=my-image-list.txt
