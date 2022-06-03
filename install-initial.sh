#!/bin/sh
#commando: nmtui, om netwerk te aan te zetten in shell

echo "#########################################################"
echo repositorys bijwerken.
echo "#########################################################"
sudo dnf update -y

#echo "#########################################################"
#echo wijzig de hostnaam
#echo "#########################################################"
#hostnamectl set-hostname RockyWerkkamer
#hostnamectl set-hostname rocky-mood.vanzeijl.net
#sudo hostnamectl set-hostname rocky-laptop.vanzeijl.net

echo "#########################################################"
echo install git
echo "#########################################################"
sudo dnf install -y git

#git init
#git branche -m master main #werkt nog niet in deze versie
#Maar als ik het clone vanaf de NAS is de branch name goed ;-)

#git config --global user.name "EmileSPX"
#git config --global user.email "Emile@vanZeijl.net"

echo "#########################################################"
echo install Ansible
echo "#########################################################"
#https://www.linuxtechi.com/how-to-install-ansible-on-rocky-linux/
sudo dnf install -y epel-release
sudo dnf install -y ansible

echo "#########################################################"
sudo ansible-pull -U https://github.com/Milio64/setup.git
echo "#########################################################"
echo "#########################################################"
echo "#########################################################"
echo "#########################################################"


exit


#zit dit ook bij werkstation versie er in?
#anders op server installaties nakijken/enable?
#systemctl enable --now cockpit.socket
sudo reboot

#################################################################################
#Ansible installatie veranderd als root user moet ansible beschikbaar zijn anders werkt deze opzet niet.
#Daarom niet via PIP geinstalleerd
echo installeren als user!!!
if [ "$USER" == 'root' ]
	then 
		echo installeren als user!!!
		exit
fi

#alternatives --config python
#https://www.linuxtechi.com/how-to-install-ansible-on-rocky-linux/
echo "#########################################################"
ech install PIP
echo "#########################################################"
sudo yum install -y python39-pip

#install ansible via PIP in user enviorment
echo install PIP
pip3 install --upgrade pip

#pip3 install setuptools-rust wheel
#directory nog toevoegen aan path, wat doen die tools?
#path: /home/emile/.local/bin
echo "#########################################################"
echo install Ansible
echo "#########################################################"
pip install --upgrade ansible

