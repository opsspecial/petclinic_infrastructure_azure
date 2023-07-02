#!/usr/bin/env bash
set -x
export DEBIAN_FRONTEND=noninteractive
export HOMEDIR='/home/azadmin'
sudo apt-get update
sudo apt install software-properties-common -y 
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y



# Disable Hostkey Checking
tee $HOMEDIR/.ssh/config > /dev/null <<EOF
Host 10.*
  StrictHostKeyChecking no
EOF


# Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash  
# Disable hostkey checking 
sudo sed -i 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg
sudo sed -i '/host_key_checking/s/False/True/g' /etc/ansible/ansible.cfg

#disable deprecation_warnings = True
sudo sed -i 's/#deprecation_warnings/deprecation_warnings/g' /etc/ansible/ansible.cfg
sudo sed -i '/deprecation_warnings/s/True/False/g'  /etc/ansible/ansible.cfg 



# Git Hub actions Runner

# Create a folder
mkdir $HOMEDIR/actions-runner && cd $HOMEDIR/actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.305.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.305.0/actions-runner-linux-x64-2.305.0.tar.gz
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.305.0.tar.gz


# Install maven 3.9.3
cd $HOMEDIR
curl -LO https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz
gunzip apache-maven-3.9.3-bin.tar.gz 
tar xvf apache-maven-3.9.3-bin.tar
mv apache-maven-3.9.3 maven
sudo rm -rf /usr/bin/mvn
sudo ln -s /home/azadmin/maven/bin/mvn /usr/bin/mvn
export PATH=$PATH:/home/azadmin/maven/bin