#!/bin/bash

# variables (on peut en ajouter...)

AWS_REGION=$(aws ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]')
VPC_CIDR='10.15.0.0/16'
MY_PUB_CIDR='77.131.74.214/32'
SN_PUB_AZ=$AWS_REGION"a"
SN_PRIV_AZ=$AWS_REGION"b"

# create VPC and store the VPC_ID in variable

echo 'Creating VPC'
VPC_ID=$(aws ec2 create-vpc \
--cidr-block $VPC_CIDR \
--query 'Vpc.{VpcId:VpcId}' \
--output text)

# create SG (attention : l'ordre des lignes et la tabulation sont importants visiblement!!!)

sleep 3
echo 'Creating SG'
SG_ID=$(aws ec2 create-security-group \
    --group-name SG-CMA-TP \
    --query 'GroupId' \
    --description "Security group for SSH, HTTP and HTTPS access" \
    --vpc-id $VPC_ID \
    --output text)

# add SG inbound rules

sleep 3
echo 'Creating inbound SSH/HTTP/HTTPS rules in SG'
aws ec2 authorize-security-group-ingress \
--group-id $SG_ID \
--protocol tcp \
--port 22 \
--cidr $MY_PUB_CIDR

aws ec2 authorize-security-group-ingress \
--group-id $SG_ID \
--protocol tcp \
--port 80 \
--cidr $MY_PUB_CIDR

aws ec2 authorize-security-group-ingress \
--group-id $SG_ID \
--protocol tcp \
--port 443 \
--cidr $MY_PUB_CIDR

# create subnet 1 (will be public) inside VPC and store the SN_PUB_ID in variable

echo 'Creating public subnet 10.15.0.0/24 inside VPC'
SN_PUB_ID=$(aws ec2 create-subnet \
--vpc-id $VPC_ID \
--cidr-block 10.15.0.0/24 \
--availability-zone $SN_PUB_AZ \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)

# create subnet 2 (will be private) inside VPC and store the SN_PRIV_ID in variable

sleep 1
echo 'Creating private subnet 10.15.1.0/24 inside VPC'
SN_PRIV_ID=$(aws ec2 create-subnet \
--vpc-id $VPC_ID \
--cidr-block 10.15.1.0/24 \
--availability-zone $SN_PRIV_AZ \
--query 'Subnet.{SubnetId:SubnetId}' \
--output text)

# create internet gateway and store the IGW_ID in variable

sleep 1
echo 'Creating internet gateway'
IGW_ID=$(aws ec2 create-internet-gateway \
--query 'InternetGateway.{InternetGatewayId:InternetGatewayId}' \
--output text)

# attach internet gateway to VPC

sleep 3
echo 'Attaching internet gateway to VPC'
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID

# create custom route table for VPC and store the RT_ID in variable

echo 'Creating custom route table for VPC'
RT_ID=$(aws ec2 create-route-table \
--vpc-id $VPC_ID \
--query 'RouteTable.{RouteTableId:RouteTableId}' \
--output text)

# create route that points all traffic (0.0.0.0/0) to the internet gateway

echo 'Creating route 0.0.0.0/0 via internet gateway'
aws ec2 create-route \
--route-table-id $RT_ID \
--destination-cidr-block 0.0.0.0/0 \
--gateway-id $IGW_ID

# check if route has been created or not (trouver le moyen de sortir du retour)

# sleep 3
# echo 'Checking route'
# aws ec2 describe-route-tables \
# --route-table-id $RT_ID

# associate public subnet with custom route table

sleep 5
echo 'Associating public subnet with custom route table'
aws ec2 associate-route-table \
--subnet-id $SN_PUB_ID \
--route-table-id $RT_ID

# modify subnet public IP addressing behavior (to attach public IP adresses to future instances in the public subnet)

aws ec2 modify-subnet-attribute --subnet-id $SN_PUB_ID --map-public-ip-on-launch

# create ssh key pair and store it in the ~ .ssh folder

echo 'Creating ssh key pair'
aws ec2 create-key-pair \
--key-name Tp1KeyPair \
--query 'KeyMaterial' \
--output text > ~/.ssh/Tp1KeyPair.pem

# modify rights on ssh key pair

sleep 1
chmod 400 ~/.ssh/Tp1KeyPair.pem

# launch ec2 instance - Amazon Linux 2 AMI (HVM), SSD Volume Type

sleep 5
echo 'Launching Amazon Linux 2 AMI (HVM) instance'
INS_ID=$(aws ec2 run-instances \
--image-id ami-0e6f4c2b6023d32fb \
--count 1 \
--instance-type t3.micro \
--key-name Tp1KeyPair \
--security-group-ids $SG_ID \
--subnet-id $SN_PUB_ID \
--user-data file://deploy_app.sh \
--query Instances[*].{InstanceId:InstanceId} \
--output text)


## à tester sans query : --user-data file://deploy_app.sh | sudo  jq '.Instances[0].InstanceId' | sed -e 's/^"//' -e 's/"$//'

# get and store the instance's public ip adress

sleep 15
IP_PUB=$(aws ec2 describe-instances \
--instance-id $INS_ID \
--query Reservations[*].Instances[*].{PublicIpAddress:PublicIpAddress} \
--output text)

# ## ci-dessous : si on veut se connecter en ssh directement :
# # add elements to handle fingerprint (permet de passer le yes en auto à la première co ssh)

# ssh-keygen -R $IP_PUB
# ssh -o "StrictHostKeyChecking no" $IP_PUB

# # connect ssh avec jeu de clés

# ssh -i "~/.ssh/Tp1KeyPair.pem" ec2-user@$IP_PUB

echo 'Instance ready to be used'

echo 'Next steps => http://'$IP_PUB




