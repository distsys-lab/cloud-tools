#!/usr/bin/env bash

if [ -z $1 ] || [ -z $2 ]; then
    echo "Error: Argument value is missing.";
    echo "The arguments are 1:region name, 2:instance id";
    exit 1
fi
aws ec2 --region $1 stop-instances --instance-ids $2