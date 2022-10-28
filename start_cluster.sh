#!/usr/bin/env bash
source ./global_config.sh

cd aws 
source ./settings.sh
./start_instances_on_all_regions.sh
cd ..

cd azure
./sbin/vm-start.sh settings.sh
cd ..

cd gcp
source ./settings.sh
./start_all_instances.sh
cd ..