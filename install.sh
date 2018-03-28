#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y autoremove

sudo cp dhclient.conf /etc/dhcp
sudo chown root:root /etc/dhcp/dhclient.conf
sudo chmod 644 /etc/dhcp/dhclient.conf
sudo cp sudoers /etc
sudo chown -R root:root /etc/skel
sudo chmod 440 /etc/sudoers

sudo cp -Rp skel /etc
sudo chown -R root:root /etc/skel

sudo groupadd web

sudo apt-get remove -y vim
sudo apt-get install -y build-essential git cmake python3-dev python3-pip python3-virtualenv python3-numpy python3-matplotlib libpcap-dev libnet1-dev rpcbind openssh-server nmap python3-pip vim-nox htop
sudo pip3 install flake8

for i in allansw alfredk carlo chris davek georg rony
do
    sudo useradd -U -G web,sudo,adm,admin,root -m -s /bin/bash $i
    sudo mkdir /home/$i/.ssh
    sudo chmod 700 /home/$i
    sudo chmod 700 /home/$i/.ssh
    sudo cp keys/$i /home/$i/.ssh/authorized_keys
    sudo chmod 600 /home/$i/.ssh/authorized_keys
    sudo chown -R $i:$i /home/$i
done

sudo chmod 700 /root
sudo cp -Rp /etc/skel/.vim* /root
sudo chown -R root:root /root


