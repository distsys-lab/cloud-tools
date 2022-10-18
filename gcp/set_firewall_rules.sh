#!/usr/bin/env bash
source ./settings.sh

gcloud compute firewall-rules create allow-iperf3 --allow=tcp:10000
gcloud compute os-login ssh-keys add --key-file $ssh_file_path
