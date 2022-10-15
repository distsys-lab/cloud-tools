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
```
cp global_config_default.txt global_config.txt
```
