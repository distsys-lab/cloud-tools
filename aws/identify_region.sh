#!/usr/bin/env bash


#cat region_table.html | grep -B 1 -i $1 | grep "</code>" | cut -d ">" -f 3 | cut -d "<" -f 1
region_data=`cat region_table.html | grep -A 2 -i $1 | grep -v "</code>" | cut -d ">" -f 2 | cut -d "<" -f 1 | sed -z 's/\n//g' | cut -d "(" -f 2`

echo -n $region_data | cut -d ")" -f 1 | cut -d " " -f 2 | sed -z 's/\n//g' 
echo -n :
echo $region_data | cut -d ")" -f 2
#echo -n $region_data | cut -d '(' -f 2 | cut -d ')' -f 1
#echo $region_data | cut -d '(' -f 2 | cut -d ')' -f 2/watch