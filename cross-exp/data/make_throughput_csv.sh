#!/usr/bin/env bash

path="aws-inter-region-throughput/"
datas=(`ls $path | grep 20`)

for i in ${datas[@]};
do
    ./throughput_calc.sh "$path$i" > "${path}csv/${i}.csv"
done
