#!/bin/bash
## before using this script :
## need azure cli installed on local machine :
### https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli-linux?pivots=apt
## need az login :
### https://docs.microsoft.com/fr-fr/cli/azure/reference-index?view=azure-cli-latest#az_login

# variables

AZ_KEY_NAME=AzTp2KeyPair
PRIVATE_KEY_PATH=~/.ssh/AzTp2KeyPair
PUBLIC_KEY_PATH=~/.ssh/AzTp2KeyPair.pub
RG_NAME=cma-tp2-rg
TPL_NAME=cmatp2tpl_AddTags
TPL_FILE=./arm-tpl.json
PARAM_FILE=./arm-parameters.json
VM1_NAME=cma-tp2-vm1
IMG_NAME=UbuntuLTS
VM_USER_ADM=azureuser
LOCATION=germanywestcentral
LOCATION2=germanynorth
SA_NAME=cmatp2storageaccount
SA_SKU=Standard_LRS     # default = Standard_LRS
SA_PREFIX=cmatp2
APP_SERVICE_PLAN_NAME=cma-tp2-planapp

# # create ressource group

# echo 'Creating ressource group...'
# echo ''

# az group create \
#   --name $RG_NAME \
#   --location $LOCATION

# sleep 15

# deploy tpl

echo 'Deploying tpl... this may take a while'

az deployment group create \
--name $TPL_NAME \
--resource-group $RG_NAME \
--template-file $TPL_FILE \
--parameters @$PARAM_FILE \
# to do :
# depuis https://github.com/Azure/azure-quickstart-templates/blob/master/quickstarts/microsoft.compute/vm-new-or-existing-conditions/azuredeploy.json
# passer en paramètres "storageProfile" dans les "properties" de la ressource VM
# insérer "diagnosticsProfile" dans les "properties" de la ressource VM
# trouver la commande pour insérer la clé ssh publique dans le fichier arm-parameters.json au bon endroit (AdmPwdOrKey ... value :"key")
--verbose

