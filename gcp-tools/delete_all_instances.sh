#!/usr/bin/env bash

gcloud compute instances list | sed -e 's/  */ /g' | cut -d ' ' -f 1,2 | tail +2 | while read line
do
	./delete_instance.sh $line &
done

