#!/bin/bash
yum check-update
yum -y install firewalld
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload
yum -y install httpd
bash -c 'echo "Hello, World!" > /var/www/html/index.html'
systemctl enable httpd
systemctl start httpd