#!/usr/bin/env bash

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
	echo -n ` cat $i/$j.txt | awk "NR==4, NR==13 {print}" | awk '
	{ 
		if($8 == "Gbits/sec"){
			print $7*1000
		}else if($8 == "Mbits/sec"){
			print $7
		}
	}
	'| awk '{sum+=$1} END {print sum/NR}'`
        echo -n ","
    done 
    echo
done
