#!/usr/bin/env bash

gcloud compute instances delete $1 --zone=$2
