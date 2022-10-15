#!/usr/bin/env bash
source ./settings.sh

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then
    echo "Error: Argument value is missing.";
    echo "The arguments are 1:vm name, 2:region name 3:machine type";
    exit 1
fi

gcloud compute instances create "$1" --zone $2 --image $image_type --machine-type $3
