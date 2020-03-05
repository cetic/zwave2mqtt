# Setting the access point

A script is created to automate the process of creating an access point in the Raspberry Pi Zero.It can also handle a bridge connection in case the user plugs an ethernet interface and want to share the network access over the hotspot access point.

## Prerequisites

Install packages  : 

```
sudo bash packages.sh
```

## Notes

The script must be executed in super user mode, and it accepts two parameters:
+ __YourChosenPassword__: a WPA passPhrase for the access point that should be at least 8 chracters long. </b> 
+ __AccessPointName__: The access point's SSID that will be broadcasted.

## Installation

To execute the script, the commands are as follows: 

```
cd ~/zwavetomqtt/addons/hotspot-wifi/
chmod +x  hotspot-rpi.sh 
sudo ./hotspot-rpi.sh ChosenPassword AccessPointName
sudo reboot
```
