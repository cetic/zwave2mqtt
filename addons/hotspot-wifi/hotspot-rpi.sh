#!/bin/bash
#
# This is a shell script that automates the installation and settings
# of a hotspot access point on a raspberry Pi Zero (should work on RPi 3)
#
# This version uses November 2018  stretch image, please use this image
# 
# This script is developped in CETIC asbl

if [ "$EUID" -ne 0 ]
	then echo "Must be root"
	exit
fi

if [[ $# -lt 1 ]]; 
	then echo "You need to pass a password of 8 Characters or longer!"
	echo "Usage:"
	echo "sudo $0 yourChosenPassword AccessPointName"
	exit
fi

APPASS="$1"
APSSID="rPi3"
ADAPTER="eth0"

if [[ $# -eq 2 ]]; then
	APSSID=$2
fi

apt-get remove --purge hostapd -yqq
apt-get update -yqq
apt-get upgrade -yqq
apt-get install hostapd -yqq
apt-get install dnsmasq -yqq
apt-get install bridge-utils -yqq

echo "Installed packages "
echo "moving to configurations"

#setting the gateway @IP and range 
cat > /etc/dnsmasq.conf <<EOF
interface=wlan0
dhcp-range=10.0.0.2,10.0.0.20,255.255.255.0,24h
EOF

#setting the access point on wlan0 interface
cat > /etc/hostapd/hostapd.conf <<EOF
interface=wlan0
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
ignore_broadcast_ssid=0
auth_algs=1
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
wpa_passphrase=$APPASS
ssid=$APSSID
ht_capab=[HT40][SHORT-GI-20][DSSS_CCK-40]

EOF

#enabling wpa conf
sed -i -- 's/    wpa-conf \/etc\/wpa_supplicant\/wpa_supplicant.conf//g' /etc/network/interfaces

#pointing to the hostapd conf file previously edited
sed -i -- 's/#DAEMON_CONF=""/DAEMON_CONF="\/etc\/hostapd\/hostapd.conf"/g' /etc/default/hostapd


cat >> /etc/network/interfaces <<EOF
# Added by Access Point Setup

# Bridge setup
auto br0
iface br0 inet manual
bridge_ports eth0 wlan0

#Access Point setup
allow-hotplug wlan0
iface wlan0 inet manual
EOF

#fixing the @IP of the acces point's interface
echo "interface wlan0" >> /etc/dhcpcd.conf
echo "static ip_address=10.0.0.1/24" >> /etc/dhcpcd.conf
echo "denyinterfaces wlan0" >> /etc/dhcpcd.conf



#Uncomment net.ipv4.ip_forward
sed -i -- 's/#net.ipv4.ip_forward/net.ipv4.ip_forward/g' /etc/sysctl.conf
#Change value of net.ipv4.ip_forward if not already 1
sed -i -- 's/net.ipv4.ip_forward=0/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
#Activate on current system
echo 1 > /proc/sys/net/ipv4/ip_forward

#creating bridge and adding eth0 under it
brctl addbr br0
brctl addif br0 eth0

#Allowing access to WAN network in firewall
iptables -t nat -A POSTROUTING -j MASQUERADE  

#Package forward between the Ethernet interface and the wireless interface
iptables -A FORWARD -i $ADAPTER -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT  
iptables -A FORWARD -i wlan0 -o $ADAPTER -j ACCEPT

#Saving the new firewall structure to be loaded at boot
sh -c "iptables-save > /etc/iptables.ipv4.nat"
touch /lib/dhcpcd/dhcpcd-hooks/70-ipv4-nat
echo "iptables-restore < /etc/iptables.ipv4.nat" > /lib/dhcpcd/dhcpcd-hooks/70-ipv4-nat

#enabling hostapd and dnsmasq to run at startup
systemctl enable hostapd
systemctl enable dnsmasq
systemctl unmask hostapd

#Launching the hotspot
service dhcpcd restart
service hostapd start
service dnsmasq start

echo "All done! Please reboot"



