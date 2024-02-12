#!/bin/bash

# Kali Linux Setup by Alakar_TCM
# Version 0.2.0

# Much of the work this script was doing has been offloaded to ansible,
# which will now be included in this version of the script and going forward.
# This script requires elevated privileges, take this into account when running this script
# This script is meant for educational purpoeses only. Only utilize tools contained within on systems you have explicity permission to do so. 



# Anisble
#########################################################

# 1- Install ansible to the system


apt -y install ansible-core

# 2- Download the ansible playbook to install tools and configure the terminal to my liking.

git clone https://github.com/Alakartcm/ansible_kali.git /opt/playbook

# 3- Run the setup playbook to prepare the

ansible-playbook /opt/playbook/kali_build/test.yml

########################################################

# Pimp my kali
########################################################

# 12 installed when the ansible playbook runs

# git clone https://github.com/Dewalt-arch/pimpmykali.git /opt/pimpmykali

# 2- Run Pimp my kali

./opt/pimpmykali/pimpmykali.sh

# 3- remove pimpmykali

sudo rm -rf /opt/pimpmykali

########################################################




# Install Go Tools
########################################################

# 1- Install Kerbrute

go install github.com/ropnop/kerbrute@master

# 2- Install Gobuster

go install github.com/OJ/gobuster/v3@latest


########################################################




# Set Aliases
########################################################

# 1- Autorecon

echo "alias autorecon='python3 /opt/autorecon/autorecon.py'" | sudo tee -a /home/kali/.zshrc

# 2- Kerbrute

echo "alias kerbrute='/home/kali/go/bin/kerbrute'" | sudo tee -a /home/kali/.zshrc

# 3- Gobuster

echo "alias gobuster='/usr/bin/gobuster'" | sudo tee -a /home/kali/.zshrc

########################################################