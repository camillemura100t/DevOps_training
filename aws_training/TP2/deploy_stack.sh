#!/bin/bash

# variables

KEY_NAME=Tp2KeyPair
PATH_KEY=~/.ssh/Tp2KeyPair.pem
STACK_NAME=CamilleTp2Stack
STACK_TPL=stack-tpl.yaml
STACK_TPL_UPD=stack-tpl-upd.yaml
INS_TYPE=t2.micro
IMG_ID=ami-00c08ad1a6ca8ca7c
BUCKET_NAME=camille-s3-bucket
MY_PUB_CIDR=77.131.74.214/32

# functions

input_stack_parameters () {
echo 'Enter a stack name (no spaces - ex: CamilleTp2Stack)'
read STACK_NAME
echo 'Enter the instance type (official AWS type - ex: t2.micro)'
read INS_TYPE
echo 'Enter the AMI (image ID - ex: ami-00c08ad1a6ca8ca7c)'
read IMG_ID
echo 'Enter your ssh location (public IP - CIDR format - ex: 123.58.13.2/32)'
read MY_PUB_CIDR
echo 'Enter the S3 bucket name (3-63 characters - lowercase letters, numbers, dots and hyphens only - ex: c.m-s3-bucket)'
read BUCKET_NAME
}

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
echo ''

printf "Enter \"create\" to create a new stack\nEnter \"update\" to update an existing stack\nEnter \"delete\" to delete an existing stack\n"

read CHOICE

if [ $CHOICE = "create" ]
    then
        input_stack_parameters
        echo 'Enter the template file name (*.yaml, *.json - must be in you current folder)'
        read STACK_TPL
        aws cloudformation create-stack \
        --stack-name $STACK_NAME \
        --template-body file://$STACK_TPL \
        --parameters ParameterKey=InstanceType,ParameterValue=$INS_TYPE \
        ParameterKey=ImageId,ParameterValue=$IMG_ID \
        ParameterKey=KeyName,ParameterValue=$KEY_NAME \
        ParameterKey=SSHLocation,ParameterValue=$MY_PUB_CIDR \
        ParameterKey=BucketName,ParameterValue=$BUCKET_NAME
        echo 'Creating stack... this may take a few minutes'
fi

if [ $CHOICE = "update" ]
    then
        input_stack_parameters
        echo 'Enter the updated template file name (*.yaml, *.json - must be in you current folder)'
        read STACK_TPL_UPD
        aws cloudformation update-stack \
        --stack-name $STACK_NAME \
        --template-body file://$STACK_TPL_UPD \
        --parameters ParameterKey=InstanceType,ParameterValue=$INS_TYPE \
        ParameterKey=ImageId,ParameterValue=$IMG_ID \
        ParameterKey=KeyName,ParameterValue=$KEY_NAME \
        ParameterKey=SSHLocation,ParameterValue=$MY_PUB_CIDR \
        ParameterKey=BucketName,ParameterValue=$BucketName
        echo 'Updating stack... this may take a few minutes'
fi

if [ $CHOICE = "delete" ]
    then
        echo 'Enter a stack name'
        read STACK_NAME
        aws cloudformation delete-stack \
        --stack-name $STACK_NAME
        echo 'Deleting stack...'
fi