#!/usr/bin/env bash

if [ -z $1 ] || [ -z $2 ]; then
    echo "Error: Argument value is missing.";
    echo "The arguments are 1:vm name, 2:region name";
    exit 1
fi
gcloud compute instances delete $1 --zone=$2 -q
