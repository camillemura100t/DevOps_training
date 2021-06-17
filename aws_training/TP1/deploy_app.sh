# get and store the instance's public ip adress

IP_PUB=$(aws ec2 describe-instances \
--instance-id i-050d488dd8da20546 \
--query Reservations[*].Instances[*].{PublicIpAddress:PublicIpAddress} \
--output text)

# connect ssh - à améliorer en passant le yes en auto

ssh -i "~/.ssh/Tp1KeyPair.pem" ec2-user@$IP_PUB

# install LAMP - à améliorer en trouvant le moyen de passer les commandes via ssh

sudo yum update -y

sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

sudo yum install -y httpd mariadb-server

sudo systemctl start httpd

sudo systemctl enable httpd

