#!/usr/bin/env bash

for i in `cat clouds_hosts.txt | cut -d ":" -f 3`
do
	ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "$i"
done
