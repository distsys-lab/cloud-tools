source ../global_config.txt
# Set image type. You can chose from available_image.txt
image_type=https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-arm64-v20220927

# Set machin type. You can chose from available_machine.txt
machine_type=e2-medium

# Set your private key path
ssh_file_path=$ssh_pubkey_path

# Vm user name
vm_username=$HOME
# "friendly name, region name"
# "friendly name, region name"
# "friendly name, region name"
# "friendly name, region name"
#cluster_config=(
#"tokyo,asia-northeast1-a"
#"paris,europe-west9-a"
#"virginia,us-east4-a"
#"sydney,australia-southeast1-a"
#"paulo,southamerica-east1-a"
#)
cluster_config=()
while read line
do
    cluster_config+=($line)
done < my-region-list.txt

#echo "${cluster_config[@]}"