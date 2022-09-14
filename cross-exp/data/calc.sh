#!/bin/bash

regions=(Paris  Paulo  Sydney  Tokyo  Virginia  vm1-france  vm1-brazil  vm1-australia  vm1-japan  vm1-us paris  paulo  sydney  tokyo  virginia)
cd $1
echo -n ","
for i in ${regions[@]};
do
    echo -n $i
    echo -n ","
done

echo -n ","
echo
for i in ${regions[@]};
do
    echo -n $i
    echo -n ","
    for j in ${regions[@]};
    do
        echo -n `cat $i/$j.txt | grep "time=" | cut -d " " -f 7 | cut -d "=" -f 2 | awk '{sum+=$1} END {print sum/NR}'`
        echo -n ","
    done 
    echo
done
