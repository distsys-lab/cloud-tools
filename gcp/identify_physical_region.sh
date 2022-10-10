#!/usr/bin/env bash
cat region_table.html | grep -A 1 -i $1 | grep -v "</code>" | cut -d ">" -f 2 | cut -d "<" -f 1 | tail -n 1