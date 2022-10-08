#!/bin/bash

source ./config.txt

gcloud compute instances create "$1" --zone $2 --image $image_type --machine-type $3
