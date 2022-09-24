#### Grant new user account with privileges & assign new privileges
    sudo usermod -aG sudo,root shay && sudo visudo
#### Add the following underneath User privilege specification 
        shay	ALL=(ALL:ALL) ALL 
#### Add the following to the bottom of file under includedir /etc/sudoers.d 
        shay ALL=(ALL) NOPASSWD: ALL
#### Copy ssh key to server
    sudo su
    mkdir -p /home/shay/.ssh/ && touch /home/shay/.ssh/authorized_keys
    curl https://github.com/cityplug.keys >> /home/shay/.ssh/authorized_keys
#### Secure SSH Server by changing default port
    nano -w /etc/ssh/sshd_config
#### Find the line that says “#Port 22” and change it to desired port 
#### Scroll down until you find the line that says “PermitRootLogin” and change to “no” 
#### PermitRootLogin “no”
#### Scroll down further and find “PasswordAuthentication” and again change to “no” 
#### PasswordAuthentication “no”
    reboot
--------------------------------------------------------------------------------
    sudo su
    cd /opt && apt install git -y && git clone https://github.com/cityplug/starsgrooming && chmod +x starsgrooming/.scripts/*
------------------------------------------------------------------------------
### Run the following scripts
    cd starsgrooming/.scripts/ && ./start.sh
    sudo su
    cd /opt/starsgrooming/.scripts/ && ./finish.sh
--------------------------------------------------------------------------------
#060E25 > Dark Blue
#FD8845 > Orange
#977977 > Coral
#659FAA > Blue Gray

#733509 > Chocolate
#4E3524 > Dark Brown
#181008 > Darkest Brown
#c0c0c0 > silver 