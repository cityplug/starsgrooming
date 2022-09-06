#!/bin/bash

# --- Security Addons
groupadd ssh-users
usermod -aG ssh-users shay
sed -i '15i\AllowGroups ssh-users\n' /etc/ssh/sshd_config

mv /opt/starsgrooming/.scripts/jail.local /etc/fail2ban/jail.local

# --- Setup ufw rules
ufw allow outgoing 
ufw deny incoming 

echo
cd /website
sudo docker-compose up -d
docker ps

echo "#  ---  COMPLETED | REBOOT SYSTEM  ---  #"
exit