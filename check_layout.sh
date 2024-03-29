#!/usr/bin/env bash
source ./global_config.sh

search_ideal_layout () {
    match_cnt=0
    for i in ${cluster_config[@]};
    do
        cloud=`echo $1 | cut -d '-' -f 1`
        region=`echo $1 | cut -d '-' -f 2`
        match_line=`echo $i | grep -i $cloud | grep -i $region | wc -l`
        if [ $match_line -eq 1 ]; then
            ((match_cnt++))
        fi
    done
    echo $match_cnt
}

search_real_layout () {
    cloud=`echo $1 | cut -d ',' -f 1`
    region=`echo $1 | cut -d ',' -f 2`
    match_line=`cat hosts_list.txt | grep -i $cloud | grep -i $region | wc -l`
    echo $match_line
}
echo --------- Current Status ---------
./check_hosts_ip.sh
echo --------------------------
ok_flag=0
for i in ${cluster_config[@]};
do
    match_cnt=`search_real_layout $i`
    if [ $match_cnt -eq 1 ]; then
        :
    elif [ $match_cnt -gt 1 ]; then # >
        echo -n "you need to delete $i"
        ((match_cnt--))
        ok_flag=1
        echo " $match_cnt instance"
    elif [ $match_cnt -lt 1 ]; then # <
        echo you need to deploy $i
        ok_flag=1
    fi
done
for i in `cat hosts_list.txt | cut -d ":" -f 2`
do
    match_cnt=`search_ideal_layout $i`
    if [ $match_cnt -eq 1 ]; then
        :
    elif [ $match_cnt -gt 1 ]; then # >
        echo you need to deploy $i
        ok_flag=1
    elif [ $match_cnt -lt 1 ]; then # <
        echo -n "you need to delete $i"
        ((match_cnt--))
        ok_flag=1
        echo " $match_cnt instance"
    fi
done
if [ $ok_flag -eq 0 ]; then
    echo "Ideal state (following cluster_config). No operation required."
fi