#!/bin/sh
## Argument 1 will be password for Ansible Tower UI Admin  ##
## Argument 2 will be password for Database Admin  ##

## To execute this script run sudo su -c'sh installAnsibleTowerScript.sh Ansibleadminpassword Databaseadminpassword'  ##

echo $(date) " - Starting Script"

yum -y update --exclude=WALinuxAgent
yum clean all

### Installing Required Dependencies ###
########################################

echo $(date) " - Install required dependencies - Latest EPEL, wget, ansible"
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install wget -y

#### Install Ansible ########
yum install ansible -y
#############################

echo $(date) " - Download Ansible Tower"
wget http://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-latest.tar.gz
tar xvzf ansible-tower-setup*
cd ansible-tower-setup*

# Relax the min var requirements
sed -i -e "s/10000000000/100000000/" roles/preflight/defaults/main.yml
# Allow sudo with out tty
sed -i -e "s/Defaults    requiretty/Defaults    \!requiretty/" /etc/sudoers

echo $(date) " - Create inventory file"
cat <<EOF > inventory

[tower]

localhost ansible_connection=local

[database]
[all:vars]

admin_password="$1"


pg_host=''
pg_port=''

pg_database='awx'
pg_username='awx'
pg_password="$2"

rabbitmq_port=5672
rabbitmq_vhost=tower
rabbitmq_username=tower
rabbitmq_password="$2"
rabbitmq_cookie=rabbitmqcookie

# Needs to be true for fqdns and ip addresses
rabbitmq_use_long_name=false


EOF

ANSIBLE_BECOME_METHOD=’sudo’ 
ANSIBLE_BECOME=True

### Install Ansible Tower ###
echo $(date) " - Install Ansible Tower"
bash setup.sh

echo $(date) " - Script complete"
