#!/usr/bin/env bash

for i in `cat clouds_hosts.txt | cut -d ":" -f 3`
do
    ./remote_setup.sh $i
done
