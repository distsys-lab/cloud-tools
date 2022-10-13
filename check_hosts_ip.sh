#!/usr/bin/env bash

cd aws
./list_instances_on_all_regions.sh | cut -d ":" -f 2,5 > my-hosts-list.txt
cd ..

cd azure
./sbin/vm-ip.sh settings.sh > vm.ip
cd ..

cd gcp
./vm-ip.sh > vm.ip
cd ..

(
cat aws/my-hosts-list.txt | sed s/=/:/g | while read line
do
	echo "ubuntu:aws-$line"
done

tail -n +4 azure/vm.ip | sed -e 's/  */:/g' | cut -d ':' -f 1,2 | while read line
do
	echo "ubuntu:azure-$line"
done

cat gcp/vm.ip | while read line
do
	echo "$USER:gcp-$line"
done
) > hosts_list.txt