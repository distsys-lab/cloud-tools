#!/usr/bin/env bash

cd aws
./list_instances_on_all_regions.sh | cut -d ":" -f 2,4 > my-hosts-list.txt
cd ..

cd azure
./sbin/vm-ip.sh settings.sh > vm.ip
cd ..

cd gcp
./vm-ip.sh > vm.ip
cd ..

