#!/usr/bin/env bash
curl -s https://cloud.google.com/compute/docs/regions-zones/ | sed -ne '/<table>/,/<\/table>/p' > region_table.html
regions=`gcloud compute regions list | cut -d ' ' -f 1 | tail -n +2`

for i in ${regions[@]};
do
    echo $i `./identify_physical_region.sh $i`
done
