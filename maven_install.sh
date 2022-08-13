#! /usr/bin/bash

# filename : install_maven.sh

# Script : to install Maven on the machine

clear

echo " PROVIDE ME PATH LOCATION  AS /opt/temp TO INSTALL ON SYSTEM:"
read path

echo "PROVIDE URL LINK TO DOWNLOAD APACHE-MAVEN :"
read url
echo
echo
echo "PROVIDE ME DOWNLOADING FILENAME OF APACHE-MAVEN:"
read filename

clear
echo "WE ARE ABOUT TO DOWNLOAD MAVEN"
sudo rm -rf /opt/m*n
mkdir $path
cd $path
sleep 3
wget $url
echo "DOWNLOAD WAS SUCCESSFULLY, SHORTLY $filename WILL BE UNZIPPED"
clear
tar -xvf $filename
rm -rf $filename
echo "*************************************************************"
echo
echo
echo
echo
echo "MAVEN WAS SUCCESSFULLY INSTALLED"
echo
echo
echo "************************************************************"
echo " WE ARE ABOUT TO CONFIGURE THE ENVIRONMENT VARIABLES FOR MAVEN"
echo `pwd`
var_maven=`ls`
echo $var_maven
sudo mv $var_maven maven
sudo mv maven /opt/
sudo rm -rf /etc/profile.d/maven.sh
sudo touch /etc/profile.d/maven.sh
echo "MAVEN SUCCESSFULLY INSTALLED "
sudo echo "export M2_HOME=/opt/maven" > /opt/maven.conf
sudo echo "export PATH=${M2_HOME}/bin:${PATH}" >> /opt/maven.conf
echo "CONFIGURATION IS READY AT LOCATION : /etc/profile.d/maven.sh "
echo " /opt/maven.conf file contains environment information, copy environment variables into /etc/profile.d/maven.sh"
echo " after copy, logout and login back into system to verify maven configurations.." 
