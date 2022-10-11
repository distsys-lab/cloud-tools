#!/usr/bin/env bash
az account list-locations --query "[].{DisplayName:displayName, Name:name, Region:metadata.physicalLocation}" -o table | rev | awk '!colname[$1]++{print}' | rev