# Global config
### Set it up for you

# Resource Name
### You can use "-" at most once due to Azure's naming policy
resource_name_prefix="hoge-hoge"

# SSH config
ssh_key_path="$HOME/.ssh/id_rsa"
ssh_pubkey_path="$HOME/.ssh/id_rsa.pub"

# Instance user name
aws_vm_username=ubuntu # Do not change
azure_vm_username=ubuntu # Choose as you like
gcp_vm_username=hoge # The local part of your gmail address

# Cluster config
### Available cloud and region combinations.
### Delete "#" where you want the instance to run.
cluster_config=(
    #"aws,Paris"
    #"aws,Tokyo"
    #"aws,Paulo"
    #"aws,Sydney"
    #"aws,Virginia"
    #"azure,Paris"
    #"azure,Tokyo"
    #"azure,Paulo"
    #"azure,Sydney"
    #"azure,Virginia"
    #"gcp,Paris"
    #"gcp,Tokyo" 
    #"gcp,Paulo" 
    #"gcp,Sydney"
    #"gcp,Virginia"
)

# List of available regions
region_list=(
    "Paris"
    "Tokyo"
    "Paulo"
    "Sydney"
    "Virginia"
)

# List of available cloud service providers
cloud_list=(
    "aws"
    "azure"
    "gcp"
)
