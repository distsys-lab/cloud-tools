#!/usr/bin/env bash

gcloud compute instances list | sed -e 's/  */ /g' | cut -d ' ' -f 1,5 | tail +2 | sed -e 's/ /:/g'
