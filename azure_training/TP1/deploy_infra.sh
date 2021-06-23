#!/bin/bash
## before using this script :
## need azure cli installed on local machine :
### https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli-linux?pivots=apt
## need az login :
### https://docs.microsoft.com/fr-fr/cli/azure/reference-index?view=azure-cli-latest#az_login

# variables

AZ_KEY_NAME=AzTp1KeyPair
PRIVATE_KEY_PATH=~/.ssh/AzTp1KeyPair
PUBLIC_KEY_PATH=~/.ssh/AzTp1KeyPair.pub
RG_NAME=cma-tp1-rg
VM1_NAME=cma-tp1-vm1
IMG_NAME=UbuntuLTS
VM_USER_ADM=azureuser
LOCATION=germanywestcentral
SA_NAME=cmatp1storageaccount

# create ressource group

echo 'Creating ressource group...'
echo ''

az group create \
  --name $RG_NAME \
  --location $LOCATION

sleep 15

# verifying ssh key pair existence on Azure / locally and deleting it if necessary

echo 'Check if Key exists on Azure / locally'
echo ''

TEST_SSH=$(az sshkey show --name $AZ_KEY_NAME -g $RG_NAME --output json 2> az_sshkey_show_error.log)

if [ -z $TEST_SSH ] && [ ! -f $PRIVATE_KEY_PATH ]
    then
    echo 'Key does not exists on both sides, OK to continue.'
    echo ''

    else
    echo 'Key already exists on Azure and/or locally, deleting it on both sides...'
    echo ''
    az sshkey delete --name $AZ_KEY_NAME -g $RG_NAME -y
    sudo rm -f $PUBLIC_KEY_PATH $PRIVATE_KEY_PATH
    sleep 10
fi

# create ssh key pair and modifying rights

echo 'Creating ssh key pair locally and pushing it on Azure...'
echo ''

ssh-keygen -q -t rsa -b 4096 -m PEM -C "$VM_USER_ADM@$VM1_NAME" -f $PRIVATE_KEY_PATH -N ''

sleep 3

chmod 400 $PRIVATE_KEY_PATH
chmod 400 $PUBLIC_KEY_PATH

az sshkey create \
  --name $AZ_KEY_NAME \
  --location $LOCATION \
  --resource-group $RG_NAME \
  --public-key @$PUBLIC_KEY_PATH

sleep 10

echo 'SSH key pair created & ready to be used'
echo ''

# # connect ssh avec jeu de clés

# ssh -i "~/.ssh/Tp1KeyPair.pem" ec2-user@$IP_PUB

# # create storage account (for fun only)

# az storage account create \
#   --name $SA_NAME \
#   --resource-group $RG_NAME \
#   --location $LOCATION \
#   --sku Standard_RAGRS \
#   --kind StorageV2

# create vm

echo 'Creating VM1...'
echo ''

az vm create \
--resource-group $RG_NAME \
--name $VM1_NAME \
--image $IMG_NAME \
--admin-username $VM_USER_ADM \
--output json \
--verbose \
--ssh-key-value $PUBLIC_KEY_PATH

sleep 10

az vm open-port \
  -g $RG_NAME \
  -n $VM1_NAME \
  --port 80


