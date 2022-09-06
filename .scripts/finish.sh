#!/bin/bash

# --- Security Addons
groupadd ssh-users
usermod -aG ssh-users shay
sed -i '15i\AllowGroups ssh-users\n' /etc/ssh/sshd_config

mv /opt/starsgrooming/.scripts/jail.local /etc/fail2ban/jail.local

# --- Setup ufw rules
ufw allow outgoing 
ufw deny incoming
ufw allow http
ufw allow https
ufw allow port 4792 from 81.174.167.183
ufw allow port 6105 from 81.174.167.183
ufw deny port 22

echo
cd /website
sudo docker-compose up -d
docker ps

echo "#  ---  COMPLETED | REBOOT SYSTEM  ---  #"
exit