https://cloud.google.com/sdk/gcloud/reference/compute/instances/create
install gcloud

https://qiita.com/G-awa/items/e6904b040caa0096fba0


cd ~/

source .bashrc


https://qiita.com/G-awa/items/e6904b040caa0096fba0

```
image_type=https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-v20220901
machine_type=e2-medium
ssh_file_path=~/.ssh/id_rsa

cluster_config=(
"tokyo,asia-northeast1-a"
"paris,europe-west9-a"
"virginia,us-east4-a"
"sydney,australia-southeast1-a"
"paulo,southamerica-east1-a"
)
```


```
gcloud compute zones list > available_zone.txt
gcloud compute images list > available_image.txt
gcloud compute machine-types list > available_machine.txt
```

create instance https://qiita.com/kosuke_nishaya/items/a84979b45cd71b5c6e00

