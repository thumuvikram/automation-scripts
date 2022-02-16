#! /usr/bin/bash

# ------------------------------------------------------------------
#    Title : Script to Setup Static IP
#    Author : thumuvikram@gmail.com
#    Script version : 1.0
#    Description : This script will setup static IP for Chef Server
# ------------------------------------------------------------------

        echo "Enter below values of Chef-Workstation as per Plan"               
        read -p 'Enter New Hostname for Work Station: ' chef_workstation_hostname
        read -p 'Enter a Static IP to configure for Workstation: ' chef_workstation_staticip
        read -p 'Enter Gateway IP Address: ' gateway
        echo "we are about setup static ip for Workstation ....."
        sleep 10
        hostnamectl set-hostname $chef_workstation_hostname
        cp /etc/hosts /etc/hosts.bak
        echo "$chef_workstation_staticip $chef_workstation_hostname" >> /etc/hosts
        rm -f /etc/sysconfig/network-scripts/ifcfg-enp0s3.bak
        cp /etc/sysconfig/network-scripts/ifcfg-enp0s3 /etc/sysconfig/network-scripts/ifcfg-enp0s3.bak
        echo "IPADDR=$chef_workstation_staticip \nDNS1=$gateway \nDNS2=8.8.8.8 \nGATEWAY=$gateway" >> /etc/sysconfig/network-scripts/ifcfg-enp0s3
        sed -i 's/dhcp/static/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
        sed -i 's/ONBOOT=no/ONBOOT=yes/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
        echo "We have successfully configured Chef Workstation on static IP"
        sleep 3
        echo "Chef Workstation will reboot to impact changes and reconnect using new static IP"
        sleep 3
        shutdown -r
