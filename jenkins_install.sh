#! /usr/bin/bash

# filename : jenkins_install.sh

# Script : to install jenkins on the machine RHEL
sudo yum -y update
# sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
# sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
# sudo yum install -y jenkins
yum install -y http://pkg.jenkins-ci.org/redhat/jenkins-2.141-1.1.noarch.rpm
sudo service jenkins start
sudo chkconfig jenkins on
firewall-cmd --permanent --new-service=jenkins
firewall-cmd --permanent --service=jenkins --set-short="Jenkins Service Ports"
firewall-cmd --permanent --service=jenkins --set-description="Jenkins service firewalld port exceptions"
firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
firewall-cmd --permanent --add-service=jenkins
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --reload
echo " JENKINS SERVER IS ACCESSIBLE LINK: `hostname -I`:8080"
