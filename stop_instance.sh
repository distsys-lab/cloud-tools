#!/usr/bin/env bash
source ./global_config.sh

cd aws 
source ./settings.sh
for i in `./list_instances_on_all_regions.sh`
do
 aws ec2 --region `echo $i | cut -d : -f 1` stop-instances --instance-ids `echo $i | cut -d : -f 3`
done
cd ..

cd azure

cd ..

cd gcp

cd ..