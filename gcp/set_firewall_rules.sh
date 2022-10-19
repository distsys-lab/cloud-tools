#!/usr/bin/env bash
source ./settings.sh

gcloud compute os-login ssh-keys add --key-file $ssh_file_path
gcloud compute firewall-rules create allow-icmp --direction=ingress --priority=65534 --network=default --action=allow --rules=icmp --source-ranges=0.0.0.0/0
gcloud compute firewall-rules create allow-tcp --direction=ingress --priority=65534 --network=default --action=allow --rules=tcp:10000-65535 --source-ranges=0.0.0.0/0
gcloud compute firewall-rules create allow-ssh --direction=ingress --priority=65534 --network=default --action=allow --rules=tcp:22 --source-ranges=0.0.0.0/0
#gcloud compute firewall-rules create default-allow-ssh --allow=tcp:22