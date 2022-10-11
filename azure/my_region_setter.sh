#!/usr/bin/env bash
(
echo "cluster_config=("
cnt=1
for i in `cat my-region-list.txt | sed -e 's/\s\s\s*/:/g' | cut -d ":" -f 2`
do
    echo "\"$i    $i  10.$cnt.0.0 1\""
    ((cnt++))
done
echo ")"
) > cluster_config.sh