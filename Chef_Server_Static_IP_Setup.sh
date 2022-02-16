#! /usr/bin/bash

# ------------------------------------------------------------------
#    Title : Script to Setup Static IP
#    Author : thumuvikram@gmail.com
#    Script version : 1.0
#    Description : This script will setup static IP for Chef Server
# ------------------------------------------------------------------

        Echo "Enter below values of Chef-Server as per Plan"
        read -p 'Enter Hostname for Chef Server:' chef_server_hostname
        read -p 'Enter a Static IP to configure for chef Server:' chef_server_staticip
        read -p 'Enter Gateway IP Address:' gateway
        echo "we are about setup statip for Chef Server ....."
        sleep 10
        hostnamectl set-hostname $chef_server_hostname
        cp /etc/hosts /etc/hosts.bak
        echo "$chef_server_staticip $chef_server_hostname" >> /etc/hosts
        rm -f /etc/sysconfig/network-scripts/ifcfg-enp0s3.bak
        cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /etc/sysconfig/network-scripts/ifcfg-enp0s3.bak
        echo -e "IPADDR=$chef_server_staticip \nDNS1=$gateway \nDNS2=8.8.8.8 \nGATEWAY=$gateway" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
        sed -i 's/dhcp/static/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
        sed -i 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
        echo "We have successfully configured Chef Server on static IP"
        sleep 3
        echo " Chef Server will reboot to impact changes and reconnect using new static IP"
        sleep 3
        shutdown -r
