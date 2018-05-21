#! /usr/bin/bash

# file name : java_install.sh

# purpose : to install software java Software from Oracle Web site

clear

echo " ENTER THE PATH WHERE TO INSTALL JAVA SOFTWARE:"
read path

echo "ENTER JAVA URL TO DOWNLOAD :"
read url

echo " ENTER JAVA DOWNLOAD FILE NAME :"
read filename

echo " THANK YOU INFORMATION, SYSTEM IS ABOUT TO INSTALL JAVA SOFTWARE NOW"
echo "____________________________________________________________________"

clear
rm -rf $path
mkdir $path
cd $path

wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" $url


clear
echo "DOWNLOAD WAS SUCCESSFULL, WE ARE ABOUT TO UNZIP SOFTWARE"
sleep 4
clear

tar -zxvf $filename

echo "***************************************************"
echo "JAVA WAS SUCCESSFULLY INSTALLED AT LOCATION : $path"
echo "***************************************************"
sleep 4

clear
echo " WE ARE ABOUT TO REMOVE THE FILE THAT WAS DOWNLOADED TO SAVE DISK SPACE"
cd $path
rm -rf $filename
echo " REMOVED DOWNLOADED FILE SUCCESSFULLY"
sleep 4

clear
echo " SETTING THE ENVIRONMENT VARIABLES FOR JAVA SOFTWARE"
java_var=`ls`

#for JAVA

update-alternatives --install /usr/bin/java java /opt/java/$java_var/bin/java 100  
update-alternatives --config java

#For JAVAC

update-alternatives --install /usr/bin/javac javac /opt/java/$java_var/bin/javac 100  
update-alternatives --config javac

#For JAR

update-alternatives --install /usr/bin/jar jar /opt/java/$java_var/bin/jar 100  
update-alternatives --config jar




cd $HOME
touch java_env.conf


echo "export JAVA_HOME=/opt/java/$java_var/" > java_env.conf 

echo "export JRE_HOME=/opt/java/$java_var/jre" >> java_env.conf 


echo "export PATH=$PATH:/opt/java/$java_var/bin:/opt/java/$java_var/jre/bin" >> java_env.conf


echo " NOTE -- please copy  the content of $HOME/java_env.conf file into $HOME/.bash_profile to set the environment variables "

echo "-------------------------------"
echo "JAVA SOFTWARE INSTALLED VERSION IS:"
echo `java -version`

