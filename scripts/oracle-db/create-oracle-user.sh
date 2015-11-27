#!/bin/sh -x

groupadd $OS_GROUP -g 500
groupadd $OS_DBA_GROUP -g 502
useradd -b /home -g $OS_GROUP -G $OS_DBA_GROUP -u 501 $OS_USER
echo "welcome1" | passwd --stdin $OS_USER

sed -i '/.*EOF/d' /etc/security/limits.conf
echo "* soft nproc 16384" >> /etc/security/limits.conf
echo "* soft nproc 16384" >> /etc/security/limits.conf
echo "* soft nofile 16384" >> /etc/security/limits.conf
echo "* hard nofile 16384" >> /etc/security/limits.conf
echo "# EOF"  >> /etc/security/limits.conf

ulimit -u 16384

echo "net.core.rmem_max=4192608" > /tmp/.sysctl.conf
echo "net.core.wmem_max=4192608" >> /tmp/.sysctl.conf
sysctl -e -p /tmp/.sysctl.conf

yum install -y oracle-rdbms-server-11gR2-preinstall
