# cloud-tools
cloud-tools can operate virtual machines provided by multiple cloud providers through a unified interface.
The following cloud providers are currently supported

- [AWS](https://aws.amazon.com/?nc1=h_ls)
- [Azure](https://azure.microsoft.com/en-us/)
- [GCP](https://cloud.google.com/)

## Requirements
 In order for cloud-tools to work, you must have sufficient permissions to create an instance with each cloud provider. In addition, the CLI tool provided by the cloud provider must be installed locally on the PC on which cloud-tools is to run.
 
- [Install AWS CLI](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)
- [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Install GCP CLI](https://cloud.google.com/sdk/docs/install)

Once you have authenticated with each of them, you can use cloud-tools.

## Components
### [aws](https://github.com/distsys-lab/aws-tools)
These tools provide a variety of functions for managing many instances of aws in many regions at once.
This tool is derived from [dissys-lab/aws-tools](https://github.com/distsys-lab/aws-tools).

### [azure](https://github.com/xnyan/domino/tree/master/azure)
These tools provide a variety of functions for managing many instances of Azure in many regions at once. This tool is derived from [xnyan/domino/azure](https://github.com/xnyan/domino/tree/master/azure).

### gcp
These tools provide a variety of functions for managing many instances of GCP in many regions at once.
See [gcp-tools](https://github.com/distsys-lab/cloud-tools/tree/main/gcp-tools) in this repository for instructions.

## Quick start
First, create settings for all cloud instances.
```
cp global_config_default.txt global_config.txt
```
Next, rewrite `global_config.txt` according to the instructions.
Similarly, rewrite `*/settings.sh` according to the support in the file.

Once all configuration files have been filled in, you can configure the cluster across each cloud according to `global_config.txt` by entering the following command.

```
./create_cluster.sh
```
To delete all instances, enter the following command
```
./delete_cluster.sh
```
To find out the current instance placement status, enter the following command
```
./check_hosts_ip.sh
```
If you want to create a single instance on a cloud instead of batch creation, type the following command
```
./create_instance.sh aws Tokyo
```
This command places a single instance at aws tokyo. Enter a name similar to cluster_config in global_config

To delete a single instance in the same way, enter the following command
```
./delete_instance.sh aws Tokyo
```

Deleting or adding a single instance will cause discrepancies with the ideal placement (cluster_config). To check which operations are necessary to achieve the ideal cluster_config state, enter the following command
```
./check_layout.sh
```
This will output the necessary operations you should do.


