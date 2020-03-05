#!bin/bash

sudo apt-get remove --purge hostapd -yqq
sudo apt-get update -yqq
sudo apt-get upgrade -yqq
sudo apt-get install hostapd -yqq
sudo apt-get install dnsmasq -yqq
sudo apt-get install bridge-utils -yqq
