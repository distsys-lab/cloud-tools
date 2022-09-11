#!/usr/bin/env bash

gcloud compute instances stop $1 --zone=$2
