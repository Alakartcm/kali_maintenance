#!/bin/bash

# Kali Linux Setup by Alakar_TCM
# Version 0.3.0

set -euo pipefail

# User-editable variables
USER_SHELL_RC="${HOME}/.zshrc"
[ ! -f "$USER_SHELL_RC" ] && USER_SHELL_RC="${HOME}/.bashrc"

# Section: Helper Functions
log() { echo -e "\033[1;32m[+] $*\033[0m"; }
run() { log "$*"; eval "$@"; }

# Section: Pre-flight Checks
if [[ $EUID -ne 0 ]]; then
  log "This script must be run with sudo or as root."
  exit 1
fi

# Section: Update System & Install Ansible
run "apt update"
run "apt -y install ansible-core git"

# Section: Run Ansible Playbook
PLAYBOOK_PATH="/opt/playbook"
if [[ ! -d "$PLAYBOOK_PATH" ]]; then
  run "git clone https://github.com/Alakartcm/ansible_kali.git $PLAYBOOK_PATH"
fi
run "ansible-playbook $PLAYBOOK_PATH/main.yml"

# Section: PimpMyKali
PIMP_PATH="/opt/pimpmykali"
if [[ ! -d "$PIMP_PATH" ]]; then
  run "git clone https://github.com/Dewalt-arch/pimpmykali.git $PIMP_PATH"
fi
run "bash $PIMP_PATH/pimpmykali.sh"
run "rm -rf $PIMP_PATH"

# Section: Install Go Tools
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

GO_TOOLS=(
  "github.com/ropnop/kerbrute@master"
  "github.com/OJ/gobuster/v3@latest"
  "github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
  "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
  "github.com/projectdiscovery/notify/cmd/notify@latest"
  "github.com/tomnomnom/anew@latest"
  "github.com/owasp-amass/oam-tools/cmd/oam_subs@master"
)
for tool in "${GO_TOOLS[@]}"; do
  run "go install -v $tool"
done

run "updatedb"

# Section: Set Aliases and Shell Customizations
declare -A ALIASES=(
  ["autorecon"]="python3 /opt/autorecon/autorecon.py"
  ["kerbrute"]="$HOME/go/bin/kerbrute"
  ["gobuster"]="$HOME/go/bin/gobuster"
  ["xpaste"]="xclip -o -selection clipboard"
)

for name in "${!ALIASES[@]}"; do
  if ! grep -q "alias $name=" "$USER_SHELL_RC"; then
    echo "alias $name='${ALIASES[$name]}'" >> "$USER_SHELL_RC"
    log "Added alias $name to $USER_SHELL_RC"
  fi
done

# Add zsh prompt timestamp (only for zsh)
LINE="PROMPT=\$PROMPT'%F{yellow}[%D{%m/%d/%y} %D{%H:%M:%S}] '"
grep -qxF "$LINE" ~/.zshrc || echo "$LINE" >> ~/.zshrc

log "Kali Linux setup complete! Please restart your terminal or 'source $USER_SHELL_RC' to use new aliases and prompt."
