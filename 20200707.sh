#!/bin/bash

cd ~
echo "Finish Change Directory"

yum -y install java-1.8.0-openjdk
echo "Finish Install Java"

java -version
echo "Finish Check Java Version"

cd /usr/local
echo "Finish Change Directory"

yum -y install wget
echo "Finish Install wget"

wget https://ftp.jaist.ac.jp/pub/apache/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.tar.gz
echo "Finish wget tomcat"

tar -xvzf apache-tomcat-8.5.57.tar.gz
echo "Finish tar tomcat"

sed -i -e "7i -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT" /etc/sysconfig/iptables
echo "Finish insert Firewall Setting"

/etc/init.d/iptables restart
echo "Finish Restart"

mv ~/servletjsp-exercise.war /usr/local/apache-tomcat-8.5.57/webapps
echo "Finish Move File"

/usr/local/apache-tomcat-8.5.57/bin/startup.sh
echo "Finish Startup tomcat"

exit 0