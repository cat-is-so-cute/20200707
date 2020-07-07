#!/bin/bash

cd ~

yum -y install java-1.8.0-openjdk

java -version

cd /usr/local

yum -y install wget

wget https://ftp.jaist.ac.jp/pub/apache/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.tar.gz

tar -xvzf apache-tomcat-8.5.57.tar.gz

sed -i -e "7i -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT" /etc/sysconfig/iptables

/etc/init.d/iptables restart