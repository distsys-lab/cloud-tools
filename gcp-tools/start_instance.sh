#!/usr/bin/env bash

gcloud compute instances start $1 --zone=$2
