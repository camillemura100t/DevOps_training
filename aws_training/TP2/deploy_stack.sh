#!/bin/bash

KEY_NAME=Tp2KeyPair
PATH_KEY=~/.ssh/Tp2KeyPair.pem
STACK_NAME=CamilleTp2Stack
TPL=stack-tpl.yaml
TPL_UPD=stack-tpl-upd.yaml
INS_TYPE=t2.micro
IMG_ID=ami-00c08ad1a6ca8ca7c
BUCKET_NAME=camille-s3-bucket
MY_PUB_CIDR=77.131.74.214/32

# create ssh key pair

echo 'Check if Key exists on AWS / locally'

if aws ec2 wait key-pair-exists --key-names $KEY_NAME
    then
    echo 'Key already exists on AWS, deleting it'
    aws ec2 delete-key-pair --key-name $KEY_NAME
fi

if test -f $PATH_KEY
    then
    echo 'Key already exists locally, deleting it'
    sudo rm -f $PATH_KEY
fi

echo 'OK, key does not exists on both sides'

aws ec2 create-key-pair \
    --key-name $KEY_NAME \
    --query 'KeyMaterial' \
    --output text > $PATH_KEY

# modify rights on ssh key pair

sleep 1
chmod 400 $PATH_KEY

echo 'SSH created & ready to be used'

echo -e "Enter \"create\" to create a new stack\nEnter \"update\" to update an existing stack\nEnter \"delete\" to delete an existing stack"

read CHOICE

if [ "$CHOICE" == "create" ]
    then
    echo 'Enter a stack name'
    read STACK_NAME
    echo 'Enter the template file name (*.yaml, *.json)'
    read TPL
    echo 'Enter the instance type (t2.micro...)'
    read INS_TYPE
    echo 'Enter the AMI (image ID)'
    read IMG_ID
    echo 'Enter your ssh location (public IP)'
    read MY_PUB_CIDR
    echo 'Enter the S3 bucket name'
    read BUCKET_NAME
    aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://$TPL \
    --parameters ParameterKey=InstanceType,ParameterValue=$INS_TYPE \
    ParameterKey=ImageId,ParameterValue=$IMG_ID \
    ParameterKey=KeyName,ParameterValue=$KEY_NAME \
    ParameterKey=SSHLocation,ParameterValue=$MY_PUB_CIDR \
    ParameterKey=BucketName,ParameterValue=$BUCKET_NAME
fi

# aws cloudformation update-stack \
# --stack-name $STACK_NAME \
# --template-body file://$TPL_UPD \
# --parameters ParameterKey=InstanceType,ParameterValue=$INS_TYPE \
# ParameterKey=ImageId,ParameterValue=$IMG_ID \
# ParameterKey=KeyName,ParameterValue=$KEY_NAME \
# ParameterKey=SSHLocation,ParameterValue=$MY_PUB_CIDR \
# ParameterKey=BucketName,ParameterValue=$BucketName
