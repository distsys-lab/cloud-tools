#!/bin/bash

source ./config.txt

for i in ${cluster_config[@]};
do
	zone=`echo $i | cut -d ',' -f 2`
	tag=`echo $i | cut -d ',' -f 1`
	gcloud compute instances create "$name_prefix-$tag-instance" --zone $zone --image $image_type --machine-type $machine_type
done
