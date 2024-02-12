#!/bin/bash

# Kali Linux Setup by Alakar_TCM
# Version 0.1.6

# standard update before setup.

sudo apt update

# The first section is used to download and install Pimp My Kali.
# The repo will be downloaded, the script run, then the created directory will be removed.

sudo git clone https://github.com/Dewalt-arch/pimpmykali.git /opt/pimpmykali


sudo /opt/pimpmykali/./pimpmykali.sh


sudo rm -rf /opt/pimpmykali

#############################################
# This Section is for fixes/work around

# This will ensure pipx is installed, which will be important for future updates

sudo apt -y install pipx

# install pip3
sudo apt -y install python3-pip

#install go
sudo apt install golang-go

#install jq

sudo apt -y install jp

# Install the latest version of seclists & remove the old

sudo rm -rf /usr/share/seclists
sudo git clone https://github.com/danielmiessler/SecLists.git /usr/share/seclists  




##############################################

# This section will install bugbounty/appsec tools/.
# Sublist3r

sudo git clone https://github.com/aboul3la/Sublist3r.git /opt/sublist3r
pip install -r /opt/sublist3r/requirements.txt

#droopescan

pip install droopescan

#gobuster

sudo apt -y install gobuster

# fix wpscan

sudo apt -y install ruby-dev
sudo gem install wpscan

#dirsearch
sudo git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch

# Nuclei
# download PD version from github in future versions
sudo apt install nuclei
nuclei update-templates   

# tplmap (SSTI attack tool)
# This may need to stay in the sh workstream

sudo git clone https://github.com/epinna/tplmap.git /opt/tplmap

pip install -r /opt/tplmap/requirements.txt


#############################################
# This Section will install recon/ctf tools

# Auto Recon by Tib3rius

#Requirements
sudo apt -y install seclists curl enum4linux feroxbuster gobuster nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf

# Package

python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git && sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

#Add autorecon to path

#export PATH=$PATH:/home/kali/.local/bin

#######################################################################
#mitm6

sudo git clone https://github.com/dirkjanm/mitm6.git /opt/mitm6

pip install -r /opt/mitm6/requirements.txt

######################################################################

# This section will be used to install database tools





#######################################################################
# This section will install AD engagement tools

# evil-winrm

gem install evil-winrm

#kerberoast

sudo apt install kerberoast

# kerbrute

pip3 install kerbrute

######################################################################
# This Section will be used to install password tools

#username anarchy

sudo git clone https://github.com/urbanadventurer/username-anarchy.git /opt/UsernameAnarachy

######################################################################

#This section will configure the paylooads folder

#make the directories

sudo mkdir /opt/payloads
sudo mkdir /opt/payloads/windows
sudo mkdir /opt/payloads/linux

# Download adpeas

sudo git clone https://github.com/61106960/adPEAS.git /opt/payloads/windows/adpeas

# Download winpeas testing
sudo mkdir /opt/payloads/windows/winpeas

sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20220710/winPEAS.bat -P /opt/payloads/windows/winpeas

#Download linpeas

sudo mkdir /opt/payloads/linux/linpeas

sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20220710/linpeas.sh -P /opt/payloads/linux/linpeas

#Download Linux Smart Enumeration

sudo git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/payloads/linux/lse

# Download pspy 64 and 32

sudo wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64 -P /opt/payloads/linux

sudo wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32 -P /opt/payloads/linux

# Download plink.exe 64 and 32 
sudo wget https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe -O /opt/payloads/windows/plink64.exe

sudo wget https://the.earth.li/~sgtatham/putty/latest/w32/plink.exe -O /opt/payloads/windows/plink32.exe

# Download and rename linux exploit suggestor

sudo wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -P /opt/payloads/linux/linux_exploit_suggestor

sudo mv /opt/payloads/linux/linux_exploit_suggestor/linux-exploit-suggester.sh /opt/payloads/linux/linux_exploit_suggestor/les.sh



######################################################################

# This section will be used to install misc tools

# html2text

sudo apt -y install html2text

# exiftool

sudo apt -y install exiftool

# wine

echo deb http://http.kali.org/kali kali main non-free contrib | sudo tee -a /etc/apt/sources.list
echo deb-src http://http.kali.org/kali kali main non-free contrib | sudo tee -a /etc/apt/sources.list
echo deb http://security.kali.org/kali-security kali/updates main contrib non-free | sudo tee -a /etc/apt/sources.list
echo deb-src http://security.kali.org/kali-security kali/updates main contrib non-free | sudo tee -a /etc/apt/sources.list

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install wine32 -y 

# (old code) sudo dpkg --add-architecture i386 && apt-get update && apt-get install wine-bin:i386

sudo apt -y install winetricks

winetricks dotnet45 && winetricks dotnet48

#####################################################################

# Alias's

echo "# My Alias" | sudo tee -a /home/kali/.zshrc
echo "alias autorecon='/home/kali/.local/bin/autorecon'" | sudo tee -a /home/kali/.zshrc


######################################################################
# This section will fix the DB after install so locate works properly

sudo updatedb

export PATH=$PATH:/home/kali/.local/bin


###########################
# New script flow

# Setup sh
# download ansible
# run ansible playboook
# Run wget on relvant files (need to find out how to do this with docker)
# run pimp my kali
# set environment variables/config files (Proxy chains)