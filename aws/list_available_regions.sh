#!/usr/bin/env bash
#curl -s https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html | sed -ne "/<table/,/table>/p" > region_table.html
regions=`./list_regions_and_availability_zones.sh`

for i in ${regions[@]};
do
    region=`echo $i | cut -d ":" -f 1`
    echo $i:`./identify_region.sh $region | cut -d "(" -f 2 | cut -d ")" -f 1`
done | awk -F ':' '!colname[$3]++{print}' > available-regions.txt