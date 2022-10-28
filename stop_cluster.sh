#!/usr/bin/env bash
source ./global_config.sh

cd aws 
source ./settings.sh
./stop_instance_on_all_regions.sh
cd ..

cd azure
./sbin/vm-stop.sh settings.sh
cd ..

cd gcp
./stop_all_instances.sh
cd ..