# Global config

# Resource Management Name
### xxxxx-xxxxx (We can use "-" only one time in Azure rule)
resource_name_prefix="koya-test"

# SSH config
ssh_key_path="$HOME/.ssh/id_rsa"
ssh_pubkey_path="$HOME/.ssh/id_rsa.pub"

# Instance user name
aws_vm_username=ubuntu
azure_vm_username=ubuntu
gcp_vm_username=kouyan120706_gmail_com

# Cluster config
cluster_config=(
    #"cloud,region"
    #"aws,Paris"
    "aws,Tokyo"
    #"aws,Paulo"
    #"aws,Sydney"
    #"aws,Virginia"
    #"azure,Paris"
    "azure,Tokyo"
    #"azure,Paulo"
    #"azure,Sydney"
    #"azure,Virginia"
    #"gcp,Paris"
    "gcp,Tokyo" 
    #"gcp,Paulo" 
    #"gcp,Sydney"
    #"gcp,Virginia"
)

### List of available regions ###
region_list=(
    Paris
    Tokyo
    Paulo
    Sydney
    Virginia
)

### List of available Cloud Service Provider ###
cloud_list=(
    "aws"
    "azure"
    "gcp"
)