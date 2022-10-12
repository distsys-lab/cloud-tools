## Prerequisites
### How to install gcloud
- https://qiita.com/G-awa/items/e6904b040caa0096fba0
- https://cloud.google.com/sdk/docs/install

### Check possible configurations
```
gcloud compute zones list > available_zone.txt
gcloud compute images list > available_image.txt
gcloud compute machine-types list > available_machine.txt
```

## Description
The configuration of these tools is written in config.txt as follows. You can modify them as you want.
```
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
cluster_config=(
"tokyo,asia-northeast1-a"
"paris,europe-west9-a"
"virginia,us-east4-a"
"sydney,australia-southeast1-a"
"paulo,southamerica-east1-a"
)
```


### How to operate the instance
After setting cluster_config in config.txt, you can operate the instance by entering the following command.

**create and start**
```
./create_all_instances.sh
```

**delete**
```
./delete_all_instances.sh
```
**stop**
```
./stop_all_instances.sh
```

**restart**
```
./start_all_instances.sh
```

### Experiment preparation
```
./vm-ip.sh > vm.ip
./set_firewall_rules.sh
```

