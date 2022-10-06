#!/usr/bin/env bash
cd ..

cat aws-tools/my-hosts-list.txt | sed s/=/:/g | while read line
do
	echo "ubuntu:aws-$line"
done

tail -n +4 azure-tools/vm.ip | sed -e 's/  */:/g' | cut -d ':' -f 1,2 | while read line
do
	echo "ubuntu:azure-$line"
done

cat gcp-tools/vm.ip | while read line
do
	echo "$USER:gcp-$line"
done
