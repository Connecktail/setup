#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

# Update packages and install hostapd and dnsmasq
apt update -qqq
apt upgrade -yqqq
echo -n "Installing hostapd and dnsmasq..."
apt install hostapd dnsmasq -yqqq
echo "done"


# Stop the hostapd and dnsmasq services from starting automatically
systemctl stop hostapd
systemctl stop dnsmasq

# Configure the static ip address
echo -n "Configuring static ip address of the RPI..."
cat dhcpd.conf >> /etc/dhcpcd.conf
service dhcpcd restart
echo "done"

# Configure the DHCP server
echo -n "Configuring dhcp server..."
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
cat dnsmasq.conf >> /etc/dnsmasq.conf
systemctl start dnsmasq
echo -e "done\n"



# Configure the access point host software
echo -n "Specify the SSID for the access point : "
read ssid
echo -n "Specify the password for the access point : "
read password

cat hostapd.conf | sed -e "s/{{SSID}}/$ssid/" | sed -e "s/{{PASSWORD}}/$password/" > /etc/hostapd/hostapd.conf
sed -e "s@^#DAEMON_CONF=.*$>@DAEMON_CONF= \"/etc/hostapd/hostapd.conf\"@" /etc/default/hostapd > /etc/default/hostapd
systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd

# Enable routing and IP masquerading
sed -e "s/^#net.ipv4.ip_forward=1$/net.ipv4.ip_forward=1/" /etc/sysctl.conf > /etc/sysctl.conf
iptables -t nat -A  POSTROUTING -o eth0 -j MASQUERADE
netfilter-persistent save

echo -e "\n Your raspberry pi is configured to be an access point whose :"
echo -e "\t - SSID is $ssid"
echo -e "\t - PASSWORS is $password"
echo "Reboot the raspberry to see the changes"