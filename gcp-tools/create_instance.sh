#!/bin/bash

source ./config.txt

gcloud compute instances create "$name_prefix-$1-instance" --zone $2 --image $image_type --machine-type $3

gcloud compute ssh "$name_prefix-$1-instance" --ssh-key-file=$ssh_file_path --zone=$2 --dry-run

