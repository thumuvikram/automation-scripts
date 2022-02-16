#! /usr/bin/bash

# ------------------------------------------------------------------
#    Title : Script to Setup Static IP
#    Author : thumuvikram@gmail.com
#    Script version : 1.0
#    Description : This script will setup static IP for Chef Client
# ------------------------------------------------------------------

        echo "Enter below values of Chef-Client as per Plan"
        read -p 'Enter New Hostname for Chef Client: ' chef_client_hostname
        read -p 'Enter a Static IP to configure for Chef Client: ' chef_client_staticip
        read -p 'Enter Gateway IP Address: ' gateway
        echo "we are about setup static ip for Chef Client ....."
        sleep 10
        hostnamectl set-hostname $chef_client_hostname
        cp /etc/hosts /etc/hosts.bak
        echo "$chef_client_staticip $chef_client_hostname" >> /etc/hosts
        rm -f /etc/sysconfig/network-scripts/ifcfg-enp0s3.bak
        cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /etc/sysconfig/network-scripts/ifcfg-enp0s3.bak
        echo -e "IPADDR=$chef_client_staticip \nDNS1=$gateway \nDNS2=8.8.8.8 \nGATEWAY=$gateway" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
        sed -i 's/dhcp/static/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
        sed -i 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
        echo "We have successfully configured Chef Client on static IP"
        sleep 3
        echo "Chef Client will reboot to impact changes and reconnect using new static IP"
        sleep 3
        shutdown -r
