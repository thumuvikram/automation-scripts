#! /usr/bin/bash

# filename : install_maven.sh

# Script : to install Maven on the machine

clear

echo " PROVIDE ME PATH LOCATION TO INSTALL ON SYSTEM:"
read path

echo "PROVIDE URL LINK TO DOWNLOAD APACHE-MAVEN :"
read url
echo
echo
echo "PROVIDE ME DOWNLOADING FILENAME OF APACHE-MAVEN:"
read filename

clear
echo "WE ARE ABOUT TO DOWNLOAD MAVEN"
rm -rf /opt/m*
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

var_maven=`ls`
echo $var_maven
echo `mv /opt/$var_maven /opt/maven`
touch /etc/profile.d/maven.sh
echo `source /etc/profile.d/maven.sh`
echo "MAVEN SUCCESSFULLY INSTALLED "



