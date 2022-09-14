#!/bin/bash

source ./config.txt

gcloud compute instances create "$1" --zone $2 --image $image_type --machine-type $3 --metadata=ssh-keys=ubuntu:~/.ssh/id_rsa.pub
