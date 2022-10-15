source ../global_config.txt
# Choose the image you want to use
### Choose this carefully. Some images cannot be used in certain areas.

image_type=https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-arm64-v20220927

# Choose the machin you want to use
### Choose this carefully. Some machine cannot be used in certain areas.
machine_type=e2-medium

### It is recommended that you check in advance if it is available for all clusters you configure.

# Set your private key path
ssh_file_path=$ssh_pubkey_path

# Vm user name
vm_username=$gcp_vm_username

# Cluster Config
### It can be easily created with cp available-regions.txt my-region-list.txt
### Describe the cluster settings in "my-region-list.txt" in the following format.
### region_name:tag_name
### region_name:tag_name
cluster_config=()
while read line
do
    cluster_config+=($line)
done < my-region-list.txt