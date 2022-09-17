#!/usr/bin/env bash

while true
do
    echo start -----------
    ./rtt_exp.sh
    ./throughput_exp.sh
    echo end -------------
done
