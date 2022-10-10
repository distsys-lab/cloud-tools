#!/usr/bin/env bash

cat region_table.html | grep -B 1 -i $1 | grep "</code>" | cut -d ">" -f 3 | cut -d "<" -f 1