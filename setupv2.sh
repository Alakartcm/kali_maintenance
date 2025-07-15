#!/bin/bash

# Kali Linux Setup by Alakar_TCM
# Version 0.2.0

# Much of the work this script was doing has been offloaded to ansible,
# which will now be included in this version of the script and going forward.
# This script requires elevated privileges, take this into account when running this script
# This script is meant for educational purpoeses only. Only utilize tools contained within on systems you have explicity permission to do so. 



# Anisble
#########################################################

# 0- update the repositories

sudo apt update

# 1- Install ansible to the system

sudo apt -y install ansible-core

# 2- Download the ansible playbook to install tools and configure the terminal to my liking.

sudo git clone https://github.com/Alakartcm/ansible_kali.git /opt/playbook

sudo ansible-playbook /opt/playbook/main.yml

########################################################

# Pimp my kali
########################################################

# 12 installed when the ansible playbook runs

git clone https://github.com/Dewalt-arch/pimpmykali.git /opt/pimpmykali

# 2- Run Pimp my kali

sudo /opt/pimpmykali/pimpmykali.sh

# 3- remove pimpmykali

sudo rm -rf /opt/pimpmykali

########################################################



# Install Go Tools
########################################################


# 1- Install Kerbrute

go install github.com/ropnop/kerbrute@master

# 2- Install Gobuster

go install github.com/OJ/gobuster/v3@latest

# 3- Install Nuclei

go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

# 4- Install subfinder

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# 5- notify

go install -v github.com/projectdiscovery/notify/cmd/notify@latest

# 6- Install anew

go install -v github.com/tomnomnom/anew@latest

# 7- Install OAM tools from OWASP

go install -v github.com/owasp-amass/oam-tools/cmd/oam_subs@master

# 8- update locate database

updatedb


########################################################




# Set Aliases
########################################################

# 1- Autorecon

echo "alias autorecon='python3 /opt/autorecon/autorecon.py'" | sudo tee -a ~/.zshrc

# 2- Kerbrute

echo "alias kerbrute='/home/kali/go/bin/kerbrute'" | sudo tee -a ~/.zshrc

# 3- Gobuster

echo "alias gobuster='/home/kali/go/bin/gobuster'" | sudo tee -a ~/.zshrc

# 4- xclip alias's

echo "alias xpaste='xclip -o -selection clipboard'" | sudo tee -a ~/.zshrc

# 5- Add timestamps to terminal

echo -e "PROMPT=\$PROMPT'%F{yellow}%}[%D{%m/%f/%y} %D{%L:%M:%S}] '" | sudo tee -a ~/.zshrc

########################################################