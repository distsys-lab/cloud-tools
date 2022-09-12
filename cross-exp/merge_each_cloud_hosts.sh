#!/usr/bin/env bash
cd ..

cat aws-tools/my-hosts-list.txt

tail -n +4 azure-tools/vm.ip | sed -e 's/  */:/g'

cat gcp-tools/vm.ip
