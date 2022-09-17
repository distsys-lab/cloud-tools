#!/usr/bin/env bash

path="aws-inter-region-rtt/"
datas=(`ls $path | grep 20`)

for i in ${datas[@]};
do
    ./rtt_calc.sh "$path$i" > "${path}csv/${i}.csv"
done
