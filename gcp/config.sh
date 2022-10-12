# Set image type. You can chose from available_image.txt
image_type=https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20220901

# Set machin type. You can chose from available_machine.txt
machine_type=e2-medium

# Set your private key path
ssh_file_path=~/.ssh/id_rsa

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
cnt=1
while read line
do
    location=`echo $line | cut -d "," -f 1`
    tag=`echo $line | cut -d "," -f 2`
    cluster_config+=("$tag $location")
    ((cnt++))
done < my-region-list.txt

#echo "${cluster_config[1]}"