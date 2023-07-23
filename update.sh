#!/bin/bash

# Kali Linux Tool Update by Alakar_TCM
# Version 0.1

# Update linpeas - Completed
# Update winpeas- completed
# Update adpeas- completed
# Update Linux Exploit Suggestor -Completed
# Update Linux Smart Enumeration -Completed


# Update repos for Kali Linux

sudo apt update

# Remove old payloads

sudo rm /opt/payloads/linux/linpeas/linpeas.sh
sudo rm /opt/payloads/windows/winpeas/winpeas.bat
sudo rm /opt/payloads/windows/winpeas/winpeasx86.exe
sudo rm /opt/payloads/windows/winpeas/winpeasx64.exe
sudo rm -rf /opt/payloads/windows/adpeas
sudo rm -rf /opt/payloads/linux/lse
sudo rm -rf /opt/payloads/linux/linux_exploit_suggestor


# download linpeas

sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20220710/linpeas.sh -P /opt/payloads/linux/linpeas

# downloads and rename adpeas
sudo git clone https://github.com/61106960/adPEAS.git /opt/payloads/windows/adpeas
sudo mv /opt/payloads/windows/adpeas/adPEAS-Light.ps1 /opt/payloads/windows/adpeas/adpeas-light.ps1
sudo mv /opt/payloads/windows/adpeas/adPEAS.ps1 /opt/payloads/windows/adpeas/adpeas.ps1

# download and rename winpeas

sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20220710/winPEAS.bat -P /opt/payloads/windows/winpeas
sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20230723-107ba027/winPEASx64.exe -P /opt/payloads/windows/winpeas
sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20230723-107ba027/winPEASx86.exe -P /opt/payloads/windows/winpeas

sudo mv /opt/payloads/windows/winpeas/winPEAS.bat /opt/payloads/windows/winpeas/winpeas.bat; sudo mv /opt/payloads/windows/winpeas/winPEASx64.exe /opt/payloads/windows/winpeas/winpeasx64.exe; sudo mv /opt/payloads/windows/winpeas/winPEASx86.exe /opt/payloads/windows/winpeas/winpeasx86.exe

# download Linux Smart Enumeration

sudo git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/payloads/linux/lse

# download and rename Linux Exploit Suggestor

sudo wget https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh -P /opt/payloads/linux/linux_exploit_suggestor

sudo mv /opt/payloads/linux/linux_exploit_suggestor/linux-exploit-suggester.sh /opt/payloads/linux/linux_exploit_suggestor/les.sh
