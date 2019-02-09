#!/bin/bash

clear
echo
echo "--------------------------------------------------"
echo " This will install Gooby"
echo " Please sit back while we intialize dependencies"
echo " For best results, run as user 'root'"
echo "--------------------------------------------------"
echo

sleep 10
sudo apt-get update -y
sudo apt-get upgrade -y

APPLIST="git fail2ban nano unzip wget curl rsync grsync ufw socat fuse apt-transport-https acl mergerfs ca-certificates gpg-agent"

for i in $APPLIST; do
  sudo apt-get -y install $i
done

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw --force enable

sudo rm -r /opt/.Gooby > /dev/null 2>&1
sudo git clone -b master https://github.com/TechPerplexed/Gooby /opt/.Gooby

if [ -d /opt/.Gooby ]; then
	sudo rm -r /opt/Gooby
	sudo mv /opt/.Gooby /opt/Gooby
	sudo chmod +x -R /opt/Gooby/install
	sudo chmod +x -R /opt/Gooby/menus
	sudo chmod +x -R /opt/Gooby/scripts/bin
	sudo chmod +x -R /opt/Gooby/scripts/cron
	sudo rsync -a /opt/Gooby/scripts/bin/gooby /bin
	sudo chmod 755 /bin/gooby
fi

source /opt/Gooby/menus/variables.sh

clear
echo "${GREEN}"
echo "--------------------------------------------------"
echo " Server inialization and dependencies complete!"
echo " Type ${WHITE}gooby${GREEN} to continue installation."
echo " Visit techperplexed.ga for setup instructions."
echo "--------------------------------------------------"
echo "${STD}"
