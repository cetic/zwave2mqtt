#!bin/bash

echo ">>>Install dependancies"

sudo apt-get install apt-transport-https

echo ">>>Create /etc/apt/sources.list.d/docker.list"

sudo sh -c 'echo "deb [arch=armhf] https://download.docker.com/linux/raspbian $(lsb_release -c -s) stable" > /etc/apt/sources.list.d/docker.list'

echo ">>>Get the apt key :"

wget -O - https://download.docker.com/linux/raspbian/gpg | sudo apt-key add -

sleep 3

echo ">>>Install Docker & Docker-ycompose:"

sudo apt-get update

sudo apt-get install docker-ce=18.06.1~ce~3-0~raspbian

sudo apt-get install docker-compose -y

 

echo ">>>Optionnal : allow some users to use Dls /e   ocker (for example, user pea) :"

sudo usermod -G docker pi

echo ">>> Creat zwave dongle static link"
sudo sh -c "echo 'SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"0658\", ATTRS{idProduct}==\"0200\", SYMLINK+=\"zwave\"' > /etc/udev/rules.d/98-usb-serial.rules"
