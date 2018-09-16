hostnamectl set-hostname chef-server

echo "192.168.0.200 	chef-server"  >> /etc/hosts
echo "192.168.0.150   chef-workstation" >> /etc/hosts
echo "192.168.0.100	  chef-node" >> /etc/hosts


cd /etc/sysconfig/network-scripts/


sed '-s/dynamic/static' ifcfg-enp0s3
sed '-s/ONBOOT=no/ONBOOT=yes' ifcfg-enp0s3

echo "IPADDR=192.168.0.X" >> ifcfg-enp0s3
echo "DNS1=192.168.0.1" >> ifcfg-enp0s3
echo "DNS2=8.8.8.8" >> ifcfg-enp0s3
echo "GATEWAY=192.168.0.1" >> ifcfg-enp0s3

service network restart
logout





