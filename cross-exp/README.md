## Experiment preparation
Enter the following commands after you have finished setting up the instances you wish to use in each cloud.
```
./merge_each_cloud_hosts.sh > clouds_hosts.txt
./remote_setup_on_all_regions.sh
```

## Experiment
**RTT measurements**
```
./rtt_exp.sh
```
**Throughput measurements**
```
./throughput_exp.sh
```
**Two experiments together**
```
./exp.sh
```

Experimental data is stored in `data/`.
