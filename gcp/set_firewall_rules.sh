#!/usr/bin/env bash
source ./settings.sh

gcloud compute os-login ssh-keys add --key-file $ssh_file_path
gcloud compute firewall-rules create allow-icmp --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=icmp --source-ranges=0.0.0.0/0
gcloud compute firewall-rules create allow-iperf3 --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:10000-65535 --source-ranges=0.0.0.0/0
gcloud compute firewall-rules create allow-ssh --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0