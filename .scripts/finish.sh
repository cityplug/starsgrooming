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
ufw allow port 4792
ufw deny port 22

# --- Docker Setup
echo "#  ---  cloudflareDNS  ---  #"
docker run -d --name=cloudflareDNS --restart=always -e API_KEY=GJ-HkkU58PTfckVRHZTDWI9kKul2nCxdlwCNNc2m -e ZONE=starsgrooming.co.uk -e PROXIED=true -e PUID=1000 -e PGID=1000 oznu/cloudflare-ddns:latest
echo "#  ---  watchtower  ---  #"
docker run -d --name=watchtower -e WATCHTOWER_CLEANUP=true -e WATCHTOWER_LABEL_ENABLE=true -e WATCHTOWER_INCLUDE_STOPPED=true -e WATCHTOWER_REVIVE_STOPPED=true -e WATCHTOWER_POLL_INTERVAL=604800 -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower:latest

echo
cd /website
sudo docker-compose up -d
docker ps

echo "#  ---  COMPLETED | REBOOT SYSTEM  ---  #"
exit