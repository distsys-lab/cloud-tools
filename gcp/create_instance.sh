#!/usr/bin/env bash
source ./settings.sh

if [ -z $1 ] || [ -z $2 ]; then
    echo "Error: Argument value is missing.";
    echo "The arguments are 1:vm name, 2:region name";
    exit 1
fi

gcloud compute instances create $1 \
    --project=$project_name \
    --zone=$2 \
    --machine-type=$machine_type \
    --network-interface=network-tier=PREMIUM,subnet=default \
    --metadata=startup-script=sudo\ ufw\ allow\ ssh,enable-oslogin=true \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=208514404532-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=$1,image=$image_type,mode=rw,size=10,type=projects/$project_name/zones/$2/diskTypes/pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --reservation-affinity=any